struct NestedOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract Test {
    p: NestedOpt;

    init() {
        self.p = NestedOpt{
            x: null,
            y: true,
            s: null
        };
    }
}