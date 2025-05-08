struct MixOrder {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: String;
    f: Bool?;
}

contract OptionalInterleave {
    data: MixOrder;

    init() {
        self.data = MixOrder{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "ok",
            f: false
        };
    }
}
