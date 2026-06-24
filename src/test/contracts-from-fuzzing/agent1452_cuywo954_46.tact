struct NestedNullable {
    inner: NullableStruct?;
}

struct NullableStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NullableTest {
    field: NestedNullable?;

    init() {
        self.field = null;
    }
}
