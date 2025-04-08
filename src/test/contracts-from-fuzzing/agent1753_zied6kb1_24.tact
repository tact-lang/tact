struct Inner { foo: Int }

contract OptionalInner {
    d: Inner?;

    init() {
        self.d = null;
    }
}