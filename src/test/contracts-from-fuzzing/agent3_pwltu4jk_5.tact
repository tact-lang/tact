struct InnerMost {
    u: Int;
    v: Bool?;
}

struct Middle {
    x: Int;
    y: InnerMost;
}

struct Outer {
    m: Middle;
    s: String;
    b: Bool;
}

contract NestedContract {
    o: Outer;

    init() {
        self.o = Outer{
            m: Middle{
                x: 10,
                y: InnerMost{
                    u: 42,
                    v: false
                }
            },
            s: "hello",
            b: true
        };
    }
}