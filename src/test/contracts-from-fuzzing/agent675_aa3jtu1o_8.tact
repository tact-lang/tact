struct Inner {
    foo: Int;
}

contract OptionalNamedStructTest {
    optNested: Inner?;

    receive() {
        let _ = self.optNested;
    }
}