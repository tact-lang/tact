struct OptionalInner {
    y: Int;
}

struct Wrapper {
    opt: OptionalInner?;
}

contract NullWrapper {
    w: Wrapper;

    init() {
        self.w = Wrapper{ opt: null };
    }
}