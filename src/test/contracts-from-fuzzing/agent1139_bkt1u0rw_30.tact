struct SInner {
    opt: Int?;
}

struct SMid {
    optInner: SInner?;
    num: Int;
}

contract MultiOptNest {
    val: SMid?;

    init() {
        self.val = SMid{
            optInner: null,
            num: 5
        };
    }
}