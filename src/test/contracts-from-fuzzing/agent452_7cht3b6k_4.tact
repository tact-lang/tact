struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test5 {
    optData: NestedOpt;
    init() {
        self.optData = NestedOpt{
            a: null,
            b: true,
            c: null
        };
    }
}
