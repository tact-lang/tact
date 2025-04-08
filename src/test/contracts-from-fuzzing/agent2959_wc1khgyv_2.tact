struct DeepInner {
    val: Int;
}

struct Middle {
    nested: DeepInner;
    flag: Bool;
}

struct OuterMost {
    sub: Middle;
    num: Int;
}

contract DeepNest {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            sub: Middle{
                nested: DeepInner{val: 42},
                flag: false
            },
            num: 77
        };
    }
}