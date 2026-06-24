struct InnerMost {
    flag: Bool;
}

struct Wrapper {
    inner: InnerMost?;
    note: String;
}

contract OptInDeep {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            inner: InnerMost{flag:true},
            note: "x"
        };
    }
}
