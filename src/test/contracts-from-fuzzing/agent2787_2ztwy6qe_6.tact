struct Sub {
    b: Bool;
    s: String;
    o: Int?;
}

struct Mid {
    sub: Sub;
    n: Int;
    o: String?;
}

struct Top {
    mid: Mid;
    flag: Bool;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{
            mid: Mid{
                sub: Sub{
                    b: true,
                    s: "ok",
                    o: null
                },
                n: 42,
                o: "hi"
            },
            flag: false
        };
    }
}
