struct DeepNested {
    v1: Int?;
    v2: Bool;
}

struct MidNested {
    mid1: DeepNested;
    mid2: Int;
}

struct Outer {
    outer1: Int;
    outer2: MidNested;
    outer3: Bool?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            outer1: 10,
            outer2: MidNested{
                mid1: DeepNested{ v1: null, v2: true },
                mid2: 42
            },
            outer3: null
        };
    }
}