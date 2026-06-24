struct AllOptional {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;
}

contract TestC {
    o: AllOptional;

    init() {
        self.o = AllOptional{};
    }
}