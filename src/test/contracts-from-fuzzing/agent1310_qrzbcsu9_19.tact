struct InnerS {
    val: Int;
}

contract NestedField {
    s: InnerS;
    init() {
        self.s = InnerS{ val: 44 };
    }
}