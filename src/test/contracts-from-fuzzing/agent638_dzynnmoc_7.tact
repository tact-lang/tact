struct Deep {
    name: String? = null;
    count: Int? = null;
}

struct MidDef {
    deep: Deep? = null;
    ready: Bool = false;
    value: Int? = null;
}

contract DefaultDeepNesting {
    record: MidDef = MidDef{ deep: null, ready: false, value: null };

    init() {
        self.record = MidDef{
            deep: Deep{ name: "ok", count: 1 },
            ready: true,
            value: 5,
        };
    }
}