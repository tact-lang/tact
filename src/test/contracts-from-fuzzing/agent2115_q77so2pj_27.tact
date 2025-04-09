// optional struct field in contract params, with nested optionals inside struct
struct OptInner {
    field: Bool?;
    data: String?;
}

contract ParamNestOpt(
    opt: OptInner?,
) {}