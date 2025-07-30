struct OptionalLayer {
    inner: String?;
    another: Int;
}

contract OptionalStringNestTest {
    payload: OptionalLayer;

    init() {
        self.payload = OptionalLayer{
            inner: null,
            another: 5
        };
    }
}