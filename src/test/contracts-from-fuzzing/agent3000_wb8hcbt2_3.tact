struct DeepNested {
    level: Int;
    info: String;
}

struct MidNested {
    flag: Bool;
    deep: DeepNested;
}

contract Test3 {
    mid: MidNested;

    init() {
        self.mid = MidNested{
            flag: true,
            deep: DeepNested{
                level: 7,
                info: "deep info",
            },
        };
    }
}
