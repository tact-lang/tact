struct SubS1 {
    x: Int;
    y: Int;
}

struct SubS2 {
    p: Int;
    q: Int?;
}

struct TopLevel {
    first: SubS1;
    second: SubS2;
    marker: Bool;
}

contract Test {
    state: TopLevel;

    init() {
        self.state = TopLevel{
            first: SubS1{ x:1, y:2 },
            second: SubS2{ p:3, q:null },
            marker: true,
        };
    }
}