struct DeepInner {
    b: Bool;
    s: String;
}

struct Middle {
    i: Int;
    inner: DeepInner;
}

struct Outer {
    middle: Middle;
    num: Int;
}

contract DeepNested {
    data: Outer;
    init() {
        self.data = Outer{
            middle: Middle{
                i: 1,
                inner: DeepInner{ b: true, s: "str" }
            },
            num: 2
        };
    }
}