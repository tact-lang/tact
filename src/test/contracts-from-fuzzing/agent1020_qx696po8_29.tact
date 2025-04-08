struct NestedDefaults {
    a: Int = 2;
    b: Bool = true;
}

struct Wrapper {
    inner: NestedDefaults;
}

contract WrapperDefaultTest {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            inner: NestedDefaults{}
        };
    }
}