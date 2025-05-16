struct DeepNested {
    flag: Bool;
    num: Int;
}

struct MidNested {
    nest: DeepNested;
    description: String;
}

contract NestedStorage {
    container: MidNested;

    init() {
        self.container = MidNested{
            nest: DeepNested{flag: false, num: 17},
            description: "desc"
        };
    }
}