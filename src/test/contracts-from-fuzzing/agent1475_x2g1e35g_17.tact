struct InnerOpt {
    q: Bool;
    w: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
    s: String;
}

struct OutOpt {
    middle: MidOpt?;
}

contract MultiOpt {
    val: OutOpt;

    init() {
        self.val = OutOpt{
            middle: null,
        };
    }
}