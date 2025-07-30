struct NestedA {
    val: Int;
}
struct NestedB {
    val: NestedA;
}
struct NestedC {
    val: NestedB;
}
struct NestedD {
    val: NestedC;
}

contract NestedWithOptionalTop {
    data: NestedD?;

    init() {
        self.data = null;
    }
}