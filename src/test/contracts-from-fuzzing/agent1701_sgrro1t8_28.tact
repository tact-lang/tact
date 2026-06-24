struct NullableNested {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract NullableNestTest {
    data: NullableNested;

    init() {
        self.data = NullableNested{
            inner: Inner{
                val: null
            }
        };
    }
}