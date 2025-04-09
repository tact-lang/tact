struct MultiLayer {
    inA: InnerA;
    inB: InnerB;
}

struct InnerA {
    foo: Int;
    bar: Bool;
}

struct InnerB {
    baz: String;
    nested: InnerC;
}

struct InnerC {
    val: Int;
    opt: Bool?;
}

contract MLTest {
    data: MultiLayer;

    init() {
        self.data = MultiLayer{
            inA: InnerA{
                foo: 1,
                bar: true,
            },
            inB: InnerB{
                baz: "s",
                nested: InnerC{
                    val: 9,
                    opt: null,
                },
            },
        };
    }
}
