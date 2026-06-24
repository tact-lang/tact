struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    d: DeepNested;
    flag: Bool;
}

struct Outer {
    m: Middle;
    num: Int;
}

contract DeepNestTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: Middle{
                d: DeepNested{ x: 42, y: true },
                flag: false
            },
            num: 100
        };
    }
}