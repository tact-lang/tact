struct Nest {
    y: Int = 3;
}

contract InitOptionalNested {
    n: Nest?;

    init() {
        self.n = Nest{};
    }
}