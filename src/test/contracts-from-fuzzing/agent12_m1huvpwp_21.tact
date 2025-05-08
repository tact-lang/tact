struct DeepInner {
    x: Int as int64;
    y: String?;
}

struct Middle {
    a: DeepInner;
    b: String?;
    c: Int as uint8;
}

struct Outer {
    m: Middle;
    note: String?;
    flag: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            m: Middle{
                a: DeepInner{
                    x: 123456,
                    y: "deep",
                },
                b: null,
                c: 255
            },
            note: "hello",
            flag: true
        };
    }
}