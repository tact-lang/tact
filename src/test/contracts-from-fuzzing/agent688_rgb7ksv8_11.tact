struct Deep {
    foo: Int?;
}

struct Wrapper {
    inner: Deep?;
}

contract OptionalStructsTest {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            inner: Deep{
                foo: 42
            }
        };
    }
}
