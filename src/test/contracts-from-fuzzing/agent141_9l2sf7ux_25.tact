struct Holder {
    a: Int;
    optInner: Inner?;
}

struct Inner {
    b: Int;
    str: String?;
}

contract OptStructInside {
    h: Holder;

    init() {
        self.h = Holder{
            a: 1,
            optInner: Inner{b:2, str:null}
        };
    }
}