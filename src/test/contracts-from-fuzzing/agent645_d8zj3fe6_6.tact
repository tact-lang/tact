struct Inner {
    s: String;
    flag: Bool;
}

struct Middle {
    nest: Inner;
    n: Int?;
}

struct Outer {
    mid: Middle;
    txt: String?;
}

contract OptNest {
    comp: Outer?;

    init() {
        self.comp = null;
    }
}
