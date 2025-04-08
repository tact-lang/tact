struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Inner;
    e: Middle;
}

struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    p: Bool?;
    q: Inner;
}

contract TestLargeNested {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 1,
            b: "hi",
            c: true,
            d: Inner{x: 2, y: "yo"},
            e: Middle{p: true, q: Inner{x:3,y:"ha"}},
        };
    }

    receive() {
        let copy = self.data;
    }
}