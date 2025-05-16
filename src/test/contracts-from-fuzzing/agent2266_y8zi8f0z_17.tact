struct Deep {
    lv: Int;
    flag: Bool;
    note: String?;
}

struct Mid {
    deep: Deep;
    ext: String;
}

struct Top {
    mid: Mid;
    status: Bool;
}

contract Test {
    t: Top;

    init() {
        self.t = Top{
            mid: Mid{
                deep: Deep{lv: 7, flag: true, note: "ok"},
                ext: "extra",
            },
            status: false,
        };
    }
}
