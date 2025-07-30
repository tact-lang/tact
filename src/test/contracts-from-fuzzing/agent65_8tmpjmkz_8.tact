struct InnerOpted {
    foo: Int;
}

struct MidOpt {
    inner: InnerOpted?;
    val: Bool;
}

contract DeepOptional {
    info: MidOpt;

    init() {
        self.info = MidOpt{
            inner: null,
            val: true
        };
    }
}