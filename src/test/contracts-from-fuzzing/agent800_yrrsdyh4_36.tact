struct NestedNullable {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract NullableFields {
    val: NestedNullable;
    init() {
        self.val = NestedNullable{
            inner: InnerOpt{value: null},
        };
    }
}