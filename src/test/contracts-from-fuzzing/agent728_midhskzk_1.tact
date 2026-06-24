struct NestedOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            x: null,
            y: null,
            s: null,
        };
    }
}