struct NestedSerialization {
    a: Int as int32;
    b: Bool;
}

struct Wrapper {
    inner: NestedSerialization;
}

contract WrapperSerializationTest {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            inner: NestedSerialization{
                a: -1024,
                b: true,
            },
        };
    }
}
