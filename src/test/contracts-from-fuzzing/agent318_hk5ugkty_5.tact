struct OptionalLayer {
    inner: Int?;
}

contract OptionalTest {
    opt: OptionalLayer?;

    init() {
        self.opt = null;
    }
}