// optional nested in contract parameter list wrapper struct
struct WrapOpt {
    nest: Nested?;
}

struct Nested {
    x: Int;
}

contract OptionalStructParam(
    wrap: WrapOpt,
) {
}