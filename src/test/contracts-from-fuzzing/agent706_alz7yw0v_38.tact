struct MixOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
}

contract TestContract {
    val: MixOrder;

    init() {
        self.val = MixOrder{
            a: 1,
            b: null,
            c: "x",
            d: true,
            e: null,
        };
    }
}