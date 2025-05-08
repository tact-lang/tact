struct Deep {
    sub: Middle;
}

struct Middle {
    sub2: Inner;
}

struct Inner {
    a: Int;
    b: String;
}

contract TestContract {
    f: Deep;

    init() {
        self.f = Deep{
            sub: Middle {
                sub2: Inner { a: 7, b: "seven" }
            }
        };
    }
}