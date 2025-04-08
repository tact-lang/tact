struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    opt1: Inner?;
    opt2: Inner?;
    str: String;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle {
            opt1: null,
            opt2: Inner {
                a: 5,
                b: true,
                c: "ok",
            },
            str: "done",
        };
    }
}