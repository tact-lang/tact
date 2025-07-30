struct DeepNested {
    c: Int;
    d: Bool;
}

struct MidNested {
    b: Int;
    deep: DeepNested;
}

struct TopNested {
    a: Int;
    mid: MidNested;
}

contract NestedTest {
    top: TopNested;

    init() {
        self.top = TopNested{
            a: 10,
            mid: MidNested{
                b: 20,
                deep: DeepNested{
                    c: 30,
                    d: true
                }
            }
        };
    }
}
