let prefix = "nfd_stub"

let prologue =
  {|
#include <nfd.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdiscarded-qualifiers"
|}


let () =
  let generate_ml, generate_c = ref false, ref false in
  let () =
    Arg.(
      parse [ "-ml", Set generate_ml, "Generate ML"; "-c", Set generate_c, "Generate C" ])
      (fun _ -> failwith "unexpected anonymous argument")
      "stubgen [-ml|-c]"
  in
  match !generate_ml, !generate_c with
  | false, false | true, true -> failwith "Exactly one of -ml and -c must be specified"
  | true, false ->
    Cstubs.write_ml
      ~concurrency:Cstubs.sequential
      Format.std_formatter
      ~prefix
      (module Nfd_bindings.M)
  | false, true ->
    print_endline prologue;
    Cstubs.write_c
      ~concurrency:Cstubs.sequential
      Format.std_formatter
      ~prefix
      (module Nfd_bindings.M)
