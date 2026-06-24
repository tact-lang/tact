struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test9 {
    optDeep: DeepOpt;
    init() {
        self.optDeep = DeepOpt{
            a: null,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}