struct NestedStruct {
    child: ChildStruct;
}

struct ChildStruct {
    grandchild: GrandChildStruct;
}

struct GrandChildStruct {
    val: Int;
    flag: Bool;
}

contract ThreeLevelNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ child: ChildStruct{ grandchild: GrandChildStruct{ val: 10, flag: true } } };
    }
}
