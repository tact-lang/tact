struct OptionalInner {
    val: Int?;
}

struct Wrap {
    inner: OptionalInner?;
    flag: Bool;
}

contract OptionalWrap {
    data: Wrap;

    init() {
        self.data = Wrap{
            inner: null,
            flag: false
        };
    }
}