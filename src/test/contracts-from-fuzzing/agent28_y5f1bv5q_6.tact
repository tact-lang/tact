struct InnerMost {
    a: Int;
}

struct Middle {
    m: InnerMost;
    opt: Bool?;
}

struct Outer {
    x: Middle;
    y: String;
    z: Int?;
}

contract Test {
    deep: Outer;

    init() {
        self.deep = Outer{
            x: Middle{m: InnerMost{a: 1}, opt: true},
            y: "hi",
            z: null
        };
    }
}