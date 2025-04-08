struct OptionalNested {
    inner: OptionalInner?;
}

struct OptionalInner {
    val: Int;
}

contract OptionalStructTest {
    st: OptionalNested;

    init() {
        self.st = OptionalNested{
            inner: OptionalInner{val: 777}
        };
    }
}