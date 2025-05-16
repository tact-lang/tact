struct NestedOpt {
    inner: Int?;
}

struct DeepNest {
    lvl1: Int;
    lvl2: NestedOpt;
}

contract DeepContract {
    deep: DeepNest = DeepNest{ lvl1: 1, lvl2: NestedOpt{ inner: null } };

    init() {
        self.deep = DeepNest{ lvl1: 3, lvl2: NestedOpt{ inner: 42 } };
    }
}