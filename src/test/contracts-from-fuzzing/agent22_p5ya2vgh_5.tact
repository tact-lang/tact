struct Deepest {
    x: Int;
    y: Bool;
}

struct Middle {
    deepest: Deepest?;
    note: String;
}

struct TopMost {
    middle: Middle;
}

contract TripleNestedOptional {
    state: TopMost;

    init() {
        self.state = TopMost{
            middle: Middle{
                deepest: null,
                note: "hi"
            }
        };
    }
}
