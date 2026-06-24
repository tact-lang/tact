struct NestedOp {
    inner: Int?;
}

struct DoubleNestedOp {
    nested: NestedOp?;
}

contract DoublyOptionalStruct {
    s: DoubleNestedOp?;

    init() {
        self.s = null;
    }
}