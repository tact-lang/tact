struct NestedWithOpt {
    val: Int?;
}

contract NestedOptStruct {
    f: NestedWithOpt = NestedWithOpt{val: null};

    init() {
        self.f = NestedWithOpt{val: 5};
    }
}
