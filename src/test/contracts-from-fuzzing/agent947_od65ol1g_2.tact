struct DeepNest {
    f: Int;
}

struct MidNest {
    e: Bool;
    deep: DeepNest;
}

struct Outer {
    a: Int;
    mid: MidNest;
}

contract TestContract {
    value: Outer;

    init() {
        self.value = Outer{
            a: 7,
            mid: MidNest{
                e: false,
                deep: DeepNest{ f: 3 },
            },
        };
    }
}