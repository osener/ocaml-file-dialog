module T = Nfd_types.M

module M (F : Cstubs.FOREIGN) = struct
  module C = struct
    include Ctypes

    let ( @-> ) = F.( @-> )
    let returning = F.returning
  end

  let pick_folder =
    F.foreign "NFD_PickFolder" C.(ptr char @-> ptr string @-> returning T.Nfd_result.t)


  let get_error = F.foreign "NFD_GetError" C.(void @-> returning string)
end
