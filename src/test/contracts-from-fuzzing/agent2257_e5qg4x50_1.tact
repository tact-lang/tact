struct SimpleStruct { a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; }

contract TestContract {
    data: SimpleStruct;

    init() {
        self.data = SimpleStruct{
            a: 1,
            b: true,
            c: "str",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}