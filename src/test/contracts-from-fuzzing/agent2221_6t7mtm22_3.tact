struct VeryNested {
    level: Int;
    child: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String?;
}

contract NestedStorage {
    data: VeryNested;

    init() {
        self.data = VeryNested{
            level: 1,
            child: InnerMost{ flag: true, note: null }
        };
    }
}
