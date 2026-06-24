struct DeepInner {
    flag: Bool;
    val: Int?;
}

struct Mid {
    d: DeepInner;
    e: Bool;
}

struct Outer {
    m: Mid;
    x: Int;
}

contract DeepNestedOptionals {
    dat: Outer;

    init() {
        self.dat = Outer{
            m: Mid{
                d: DeepInner{ flag: false, val: null },
                e: true,
            },
            x: 7,
        };
    }
}