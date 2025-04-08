struct Inner { a: Int; b: Bool; c: String; d: Cell; e: Address; }

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, c: "hi", d: emptyCell(), e: myAddress() };
    }
}