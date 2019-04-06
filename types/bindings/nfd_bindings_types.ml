module M (F : Cstubs.Types.TYPE) = struct
  module Nfd_result = struct
    type t =
      [ `Error
      | `Okay
      | `Cancel
      ]

    let t : t F.typ =
      F.enum
        "nfdresult_t"
        ~typedef:true
        [ `Error, F.constant "NFD_ERROR" F.int64_t
        ; `Okay, F.constant "NFD_OKAY" F.int64_t
        ; `Cancel, F.constant "NFD_CANCEL" F.int64_t
        ]
  end
end
