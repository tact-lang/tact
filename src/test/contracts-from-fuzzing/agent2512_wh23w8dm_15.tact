struct OptionalInner {
    a: Int;
    b: String?;
}

struct Wrapper {
    inner: OptionalInner?;
    flag: Bool;
}

contract OptionalStructInStruct {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            inner: null,
            flag: true
        };
    }
}