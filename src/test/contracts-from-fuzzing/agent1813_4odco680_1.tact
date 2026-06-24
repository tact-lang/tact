struct Inner { a: Int; b: Bool; c: String; d: Slice; }

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, c: "hello", d: emptyCell().asSlice() };
    }
}