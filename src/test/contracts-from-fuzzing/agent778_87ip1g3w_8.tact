struct Deep {
    a: Int;
    b: Bool;
}

struct Mid {
    deep: Deep;
    flag: Bool;
}

struct Top {
    mid: Mid;
    c: Int;
    opt: Bool?;
}

contract MultiNest {
    s: Top;
    init() {
        self.s = Top{
            mid: Mid{ deep: Deep{ a: 3, b: false }, flag: true },
            c: 100,
            opt: null
        };
    }
}