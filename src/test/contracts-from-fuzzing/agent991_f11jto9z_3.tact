struct DeepInner {
    flag: Bool;
    note: String?;
}

struct Mid {
    score: Int;
    deep: DeepInner;
}

struct Outer {
    label: String;
    mid: Mid;
}

contract PersistDeep {
    store: Outer;

    init() {
        self.store = Outer{
            label: "hi",
            mid: Mid{
                score: 77,
                deep: DeepInner{ flag: true, note: null }
            }
        };
    }
}