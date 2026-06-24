struct Inner { a: Int; b: Bool; c: String; d: Cell; e: Address; f: Slice; g: Builder; }

contract DeepField {
    data: Inner;

    init() {
        self.data = Inner{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
