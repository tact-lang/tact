struct DeepNested {
    leaf1: Int;
}

struct MidNested {
    midVal: String;
    branch: DeepNested;
}

struct Root {
    rootFlag: Bool;
    middle: MidNested;
}

contract DeepNestContract {
    payload: Root;

    init() {
        self.payload = Root{
            rootFlag: true,
            middle: MidNested{
                midVal: "middle",
                branch: DeepNested{ leaf1: 123 },
            },
        };
    }
}