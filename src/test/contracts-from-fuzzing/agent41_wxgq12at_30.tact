struct NestedTupleStyle {
    a: Int;
    b: Int;
    c: Int;
}

contract SequenceOfStructs {
    f1: NestedTupleStyle;
    f2: NestedTupleStyle;

    init() {
        self.f1 = NestedTupleStyle{a: 1, b: 2, c:3};
        self.f2 = NestedTupleStyle{a:4, b:5, c:6};
    }
}
