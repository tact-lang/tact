struct NestedOpt {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract Test {
    no1: NestedOpt;
    no2: NestedOpt?;

    init() {
        self.no1 = NestedOpt{
            one: 1,
            two: false,
            three: "hi",
        };
        self.no2 = null;
    }
}