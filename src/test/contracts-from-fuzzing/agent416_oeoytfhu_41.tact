struct IncludeOne {
    f: Int;
}
struct IncludeTwo {
    g: Bool;
}
struct WrapBoth {
    one: IncludeOne;
    two: IncludeTwo;
}

contract Test41 {
    data: WrapBoth;

    init() {
        self.data = WrapBoth{
            one: IncludeOne{ f: 42 },
            two: IncludeTwo{ g: true }
        };
    }
}
