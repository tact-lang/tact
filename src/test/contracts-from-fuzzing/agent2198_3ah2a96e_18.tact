struct InnerMost {
    val1: Int;
    val2: Int;
}

struct Middle {
    nested: InnerMost;
    text: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract ThreeLevel {
    top: Outer;

    init() {
        self.top = Outer{
            middle: Middle{
                nested: InnerMost{val1: 1, val2: 2},
                text: "hello"
            },
            flag: true
        };
    }
}