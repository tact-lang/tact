struct DeepOptionalInner {
    x: Int;
    y: Int;
}

struct DeepOptionalWrapper {
    inner: DeepOptionalInner?;
}

contract TestContract {
    deepOpt: DeepOptionalWrapper;

    init() {
        self.deepOpt = DeepOptionalWrapper{
            inner: null
        };
    }
}