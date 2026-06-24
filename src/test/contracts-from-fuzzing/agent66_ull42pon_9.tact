struct Inner {
    f1: Int as uint8;
    f2: Bool;
    f3: String?;
}

struct Middle {
    m1: Int;
    m2: Inner;
    m3: String;
}

contract TestContract {
    s: Middle;

    init() {
        self.s = Middle{
            m1: 99,
            m2: Inner{f1: 1, f2: false, f3: null},
            m3: "text",
        };
    }
}