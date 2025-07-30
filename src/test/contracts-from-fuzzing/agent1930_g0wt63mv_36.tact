struct NearlyEmpty {
    x: Int;
}

contract JustWrapper {
    inner: NearlyEmpty;

    init() {
        self.inner = NearlyEmpty{ x: 42 };
    }
}