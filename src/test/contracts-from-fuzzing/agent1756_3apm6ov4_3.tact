struct NestedOptionalDeep {
    inner: NestedOptionalMiddle?;
}

struct NestedOptionalMiddle {
    val: Int?;
}

contract DeepNulls {
    data: NestedOptionalDeep;

    init() {
        self.data = NestedOptionalDeep{
            inner: null
        };
    }
}
