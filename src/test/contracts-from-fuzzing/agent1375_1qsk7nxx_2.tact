struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    point: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    note: String;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                point: Inner{x: 0, y: 1},
                flag: false,
            },
            note: "deep",
        };
    }
}