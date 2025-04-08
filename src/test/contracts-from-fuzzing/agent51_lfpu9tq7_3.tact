struct InnerLevel {
    info: String;
    flag: Bool;
}

struct MidLevel {
    count: Int;
    inner: InnerLevel;
}

contract TestDeepNested {
    mid: MidLevel;

    init() {
        self.mid = MidLevel{
            count: 42,
            inner: InnerLevel{
                info: "deep",
                flag: true,
            },
        };
    }
}
