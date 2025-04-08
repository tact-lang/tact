struct OptionalInner {
    flag: Bool;
    count: Int as uint8;
}

struct Wrapper {
    opt: OptionalInner?;
}

contract OptionalNested {
    val: Wrapper;

    init() {
        self.val = Wrapper{ opt: null };
    }
}