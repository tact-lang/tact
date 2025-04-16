struct Inner {
    num: Int;
    flag: Bool;
    info: String;
    nested: Deep;
}

struct Deep {
    val: Int;
    flag: Bool;
}

contract Test {
    s: Inner;
    init() {
        self.s = Inner{
            num: 5,
            flag: true,
            info: "hi",
            nested: Deep{ val: -7, flag: false },
        };
    }
}