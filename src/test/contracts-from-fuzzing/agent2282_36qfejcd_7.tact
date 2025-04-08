struct SDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    // d: Cell = emptyCell(); // cannot use function calls in struct default
    // e: Slice = emptyCell().asSlice();
}

contract Test6 {
    s: SDefaults;

    init() {
        self.s = SDefaults{};
    }
}