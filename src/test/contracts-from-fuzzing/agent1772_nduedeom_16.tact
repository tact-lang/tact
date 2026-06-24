struct InnerSub {
    sub: Int;
}

struct Wrapper {
    payload: InnerSub;
}

contract WrapperStorage {
    w: Wrapper;

    init() {
        self.w = Wrapper{ payload: InnerSub{ sub: 7 } };
    }
}