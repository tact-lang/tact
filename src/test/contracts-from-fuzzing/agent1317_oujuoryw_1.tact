struct Inner {
    u: Int;
    b: Bool;
    s: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{u: 1, b: true, s: "one"},
            inner2: Inner{u: 2, b: false, s: "two"},
            flag: true
        };
    }
}
