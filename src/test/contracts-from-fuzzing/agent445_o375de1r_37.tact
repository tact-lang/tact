// Chain with defaults and null for nested optional struct
struct Nested {
    value: Int? = null;
}

struct WrapNested {
    nest: Nested? = null;
}

contract ChainOptNull {
    root: WrapNested = WrapNested{};
}
