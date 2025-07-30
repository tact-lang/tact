struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: InnerMost;
    z: String;
}

struct Outer {
    mid: Middle;
    s: String;
}

contract VeryDeepStorage {
    val: Outer;
    init() {
        self.val = Outer{
            mid: Middle{
                inner: InnerMost{x: 5, y: false},
                z: "middle"
            },
            s: "outer"
        };
    }
}