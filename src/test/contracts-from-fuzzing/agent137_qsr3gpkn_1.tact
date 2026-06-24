struct InnerNested { z: Int; q: Bool }

struct MidNested {
    foo: Int;
    inner: InnerNested;
}

struct Outer {
    a: Int;
    b: Bool;
    nested: MidNested;
}

contract DeepStructTest {
    info: Outer;

    init() {
        self.info = Outer{
            a: 1,
            b: true,
            nested: MidNested{
                foo: 2,
                inner: InnerNested{
                    z: 3,
                    q: false
                }
            }
        };
    }

    receive() {
        // just a dummy to make contract non-empty
    }
}