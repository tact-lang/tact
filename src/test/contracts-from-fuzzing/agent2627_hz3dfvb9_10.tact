struct NestedOptInner {
    s: String?;
    b: Bool?;
}

struct TopLevel {
    x: Int?;
    y: Bool;
    z: NestedOptInner?;
}

contract OptionalNesting {
    state: TopLevel;
    init() {
        self.state = TopLevel{
            x: null,
            y: true,
            z: NestedOptInner{s: null, b: false}
        };
    }
}