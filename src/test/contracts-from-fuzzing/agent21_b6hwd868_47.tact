struct RecOpt {
    inner: Int?;
}

contract NullableTest {
    opt: RecOpt?;

    init() {
        self.opt = null;
    }
}