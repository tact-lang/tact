struct DeepNested {
    a: Int;
    b: String;
}

struct MiddleLevel {
    c: DeepNested;
    d: Bool;
}

struct TopLevel {
    e: MiddleLevel;
    f: Int?;
}

contract DeepStorage {
    info: TopLevel;

    init() {
        self.info = TopLevel{
            e: MiddleLevel{
                c: DeepNested{
                    a: 777,
                    b: "deep",
                },
                d: false,
            },
            f: null,
        };
    }
}
