struct NestedWithOpt {
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract NestedOptField {
    val: NestedWithOpt;
    init() {
        self.val = NestedWithOpt{ s: null };
    }
}
