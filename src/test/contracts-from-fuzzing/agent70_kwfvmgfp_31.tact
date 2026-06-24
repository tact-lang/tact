message(0x7) M {
    n: Int;
}

struct Inner {
    text: String?;
}

struct S {
    optMsg: M?;
    optInner: Inner?;
}

contract TestContract {
    val: S?;

    init() {
        self.val = null;
    }

    receive() {
        self.val = S{
            optMsg: M{ n:1 },
            optInner: Inner{ text: "hi" }
        };
    }
}