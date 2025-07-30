struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test4 {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "opt"
        };
    }
}
