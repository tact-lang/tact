struct WrappedBool {
    inner: Bool;
}

contract TestContract {
    w: WrappedBool?;

    init() {
        self.w = WrappedBool{
            inner: true
        };
    }
}