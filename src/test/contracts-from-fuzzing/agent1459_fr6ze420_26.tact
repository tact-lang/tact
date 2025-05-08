// Testing optional of primitive in a struct with explicit null default
struct Wrap {
    v: Int? = null;
}

contract OptionDefaultNull {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{};
    }
}