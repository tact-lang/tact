struct DeepInner {
    a: Int;
    b: Bool;
}

struct Mid {
    inner: DeepInner;
    flag: Bool;
}

struct Outer {
    m: Mid;
    b: Bool;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            m: Mid{
                inner: DeepInner{
                    a: 5,
                    b: true,
                },
                flag: false,
            },
            b: true,
        };
    }
}