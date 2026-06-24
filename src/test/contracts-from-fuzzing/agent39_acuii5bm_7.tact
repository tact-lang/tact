struct Inner {
    flag: Bool;
    s: String;
}

struct Middle {
    optInner: Inner?;
    n: Int;
}

contract Test {
    val: Middle;

    init() {
        self.val = Middle{
            optInner: Inner{ flag: true, s: "Hello" },
            n: 100,
        };
    }
}