struct SInner {
    a: Int;
    b: String;
}

struct SOuter {
    x: Int;
    y: SInner;
}

contract TwoLevelNested {
    content: SOuter;

    init() {
        self.content = SOuter{x: 42, y: SInner{a: 1, b: "hi"}};
    }
}
