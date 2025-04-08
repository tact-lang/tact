struct BigFlat {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Builder;
}

contract LargeFlatStruct {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}
