struct Base {
    id: Int = 0;
    name: String?;
}

struct Wrapper {
    base: Base = Base{ name: null };
    valid: Bool = true;
}

contract ParamNest(
    wrap: Wrapper
) {
    receive() {}
}
