struct InnerSimple {
    num: Int;
}

struct MidSimple {
    inner: InnerSimple;
}

struct OuterSimple {
    mid: MidSimple;
}

contract MultiLevelSimple {
    field: OuterSimple;
    init() {
        self.field = OuterSimple{mid: MidSimple{inner: InnerSimple{num: 99}}};
    }
}