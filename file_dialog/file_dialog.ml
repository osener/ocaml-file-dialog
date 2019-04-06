open Ctypes
module B = Nfd_ffi.M
module T = Nfd_types.M

let pick_folder () =
  let out = allocate_n ~count:1 string in
  match B.pick_folder (Ctypes.from_voidp char null) out with
  | `Okay ->
    (match Fpath.of_string !@out with
    | Ok path -> `Okay path
    | Error (`Msg msg) -> `Error msg)
  | `Cancel -> `Cancel
  | `Error ->
    let msg = B.get_error () in
    `Error msg
