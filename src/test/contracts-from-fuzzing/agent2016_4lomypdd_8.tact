struct DeepNested {
    level: Int;
    sub: NestedInner;
}

struct NestedInner {
    flag: Bool;
    subsub: InnerMost;
}

struct InnerMost {
    x: Int;
    text: String;
}

contract Test {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            level: 1,
            sub: NestedInner{
                flag: true,
                subsub: InnerMost{ x:42, text:"deep" }
            }
        };
    }
}