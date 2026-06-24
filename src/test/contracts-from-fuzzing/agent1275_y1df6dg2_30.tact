struct NestedDeepOptional {
    inner: Inner?
}

struct Inner {
    val: Int?;
}

contract DeepOptionalTest {
    nested: NestedDeepOptional;

    init() {
        self.nested = NestedDeepOptional{
            inner: Inner{val: null},
        };
    }
}