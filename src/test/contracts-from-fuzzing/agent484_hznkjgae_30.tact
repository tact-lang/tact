struct AllDefaulted {
    x: Int = 1;
    y: Bool = true;
    z: String = "x";
}

contract Test {
    foo: AllDefaulted?;

    init() {
        self.foo = AllDefaulted{};
    }
}