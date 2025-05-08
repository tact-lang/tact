struct Something {
    a: Int = 42;
    b: Bool = true;
    c: String = "X";
}

contract DefaultNested {
    x: Something;

    init() {
        self.x = Something{};
    }
}