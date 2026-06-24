struct Wrapper {
    value: Int?;
}

contract Redefault {
    w: Wrapper;

    init() {
        self.w = Wrapper{ value: null };
        self.w.value = 71;
    }
}