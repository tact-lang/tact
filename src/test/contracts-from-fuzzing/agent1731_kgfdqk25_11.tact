struct Medium {
    num: Int;
    flag: Bool;
    txt: String;
    sub: Small;
    opt: Small?;
}

struct Small {
    a: Int;
    b: Bool;
}

contract Test {
    val: Medium;

    init() {
        self.val = Medium{
            num: 7,
            flag: false,
            txt: "hello",
            sub: Small{ a: 10, b: true },
            opt: null
        };
    }
}
