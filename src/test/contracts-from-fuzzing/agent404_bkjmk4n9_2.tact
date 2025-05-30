struct DeeplyNested {
    x: Int;
    y: Bool;
}

struct Outer {
    inners: DeeplyNested;
    optInner: DeeplyNested?;
    text: String;
    number: Int;
}

contract TestContract {
    outer: Outer;
    init() {
        self.outer = Outer{
            inners: DeeplyNested{x: 1, y: false},
            optInner: null,
            text: "aaa",
            number: 42,
        };
    }
}