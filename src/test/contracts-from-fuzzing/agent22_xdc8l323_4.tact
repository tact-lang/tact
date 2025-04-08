struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    i: Inner;
    s: String;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract DeepInit {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                i: Inner{x: 1, y: false},
                s: "hello",
            },
            flag: true,
        };
    }
}
