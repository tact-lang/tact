struct Inlined {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hello";
}

contract Test {
    s: Inlined;

    init() {
        self.s = Inlined{};
    }
}
// Tests struct with all default fields used as persistent storage, init with empty braces