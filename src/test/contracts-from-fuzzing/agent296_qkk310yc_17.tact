struct Sub {
    val: Int;
}

struct NestedOpt {
    inner: Sub?;
}

contract StructOptField {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: Sub{
                val: 55
            }
        };
    }
}
