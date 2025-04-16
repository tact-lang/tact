struct DeepNested {
    x: Int;
    y: Bool;
}

struct MidNested {
    deep: DeepNested;
    z: Bool;
}

struct TopNested {
    mid: MidNested;
    val: Int;
}

contract TestContract {
    data: TopNested;

    init() {
        self.data = TopNested{
            mid: MidNested{
                deep: DeepNested{
                    x: 1,
                    y: true,
                },
                z: false,
            },
            val: 42,
        };
    }
}