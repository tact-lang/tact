struct SmallNested {
    inner: SmallInner;
}

struct SmallInner {
    flag: Bool;
    value: Int?;
}

contract TestContract {
    sn: SmallNested;

    init() {
        self.sn = SmallNested{
            inner: SmallInner{flag: true, value: null}
        };
    }
}