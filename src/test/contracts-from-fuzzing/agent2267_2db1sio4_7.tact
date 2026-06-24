struct Inner {
    value: Int;
}

struct Wrapper {
    optInner: Inner?;
}

contract OptionalStructsContract {
    optWrap: Wrapper?;
    innerWrap: Wrapper;

    init() {
        self.optWrap = null;
        self.innerWrap = Wrapper{optInner: null};
    }
}
