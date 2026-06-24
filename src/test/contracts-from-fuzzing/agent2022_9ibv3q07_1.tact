struct DeepNested {
    value: Int;
}

struct MidNested {
    deep: DeepNested;
    optionalDeep: DeepNested?;
}

struct Outer {
    mid: MidNested;
    optionalMid: MidNested?;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: MidNested{
                deep: DeepNested{ value: 10 },
                optionalDeep: null
            },
            optionalMid: null
        };
    }
}