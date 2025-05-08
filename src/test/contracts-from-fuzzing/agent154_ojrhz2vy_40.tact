struct DefNestedInner {
    val: Int = 123;
}

struct DefNestedOuter {
    nest: DefNestedInner = DefNestedInner{};
}

contract NestedDefaultStructs {
    val: DefNestedOuter;

    init() {
        self.val = DefNestedOuter{};
    }
}