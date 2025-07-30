struct InnerOptStruct {
    val: Int;
}

struct MiddleOptStruct {
    inner: InnerOptStruct? = null;
}

struct TopOpt {
    mid: MiddleOptStruct? = null;
}

contract NestedOptStructDefaults {
    data: TopOpt;

    init() {
        self.data = TopOpt{};
    }
}
