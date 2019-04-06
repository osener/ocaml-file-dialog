let prefix = "nfd_stub"
let prologue = "\n#include <nfd.h>\n"

let () =
  Format.printf "\n%s\n" prologue;
  Cstubs.Types.write_c Format.std_formatter (module Nfd_bindings_types.M)
