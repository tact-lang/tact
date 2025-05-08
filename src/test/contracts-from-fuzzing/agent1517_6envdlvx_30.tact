struct Sub { val: Int; flag: Bool; }
struct Outer { sub: Sub; memo: String; }

contract ParamNested(
    nested: Outer,
    count: Int,
    active: Bool
) {}