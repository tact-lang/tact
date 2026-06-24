struct NestedOpt2 {
    val: Int?;
}

contract DoubleOpt {
    field: NestedOpt2?;
    init() {
        self.field = null;
    }
}