struct DeeplyNested {
    foo: Int;
    bar: StructB;
}

struct StructB {
    baz: StructC;
}

struct StructC {
    qux: Bool?;
}

contract DeepTest {
    s: DeeplyNested;

    init() {
        self.s = DeeplyNested{
            foo: 5,
            bar: StructB{
                baz: StructC{ qux: true }
            }
        };
    }
}