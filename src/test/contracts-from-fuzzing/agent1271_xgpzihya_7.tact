struct InnerS {
    v: Int;
}

struct Wrap {
    inner: InnerS?;
    flag: Bool;
}

contract OptInStruct {
    data: Wrap;
    init() {
        self.data = Wrap{
            inner: null,
            flag: true
        };
    }
    receive() {}
}