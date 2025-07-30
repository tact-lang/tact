struct OptDeep {
    inner: Int?;
}

struct WrappingOpt {
    nested: OptDeep?;
}

contract DeepOptionalTest {
    val: WrappingOpt;

    init() {
        self.val = WrappingOpt{ nested: null };
    }
}