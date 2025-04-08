struct InnerSub {
    txt: String;
    n: Int;
}

struct MidSub {
    inr: InnerSub;
    flag: Bool;
}

contract MidOpt {
    f: MidSub?;

    init() {
        self.f = null;
    }
}