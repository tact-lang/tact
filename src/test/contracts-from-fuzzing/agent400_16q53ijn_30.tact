// optional nested structs with default values
struct Inner {
    innerVal: Int = 77;
}

struct Outer {
    nested: Inner?;
}

contract OuterOptDefault {
    val: Outer = Outer { nested: null };
    init() {}
}