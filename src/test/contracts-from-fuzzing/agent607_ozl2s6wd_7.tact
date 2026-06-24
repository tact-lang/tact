struct Inner {
    val: Int?;
}

struct Wrapper {
    inner: Inner?;
}

contract OptionalStructTest {
    data: Wrapper?;
    init() {
        self.data = null;
    }
}