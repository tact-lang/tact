struct Wrapper {
    x: Int;
}

contract PrimWrap {
    w: Wrapper;

    init() {
        self.w = Wrapper{ x: 123 };
    }
}