struct InnerOpted {
    foo: Int;
}

struct MidOpt {
    inner: InnerOpted?;
    val: Bool;
}

contract DeepOptionalNonNull {
    info: MidOpt;

    init() {
        self.info = MidOpt{
            inner: InnerOpted{foo: 999},
            val: false
        };
    }
}