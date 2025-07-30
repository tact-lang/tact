struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract NestedOptionalsInField {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: null,
            c: "X",
            d: 123,
            e: null,
            f: true,
        };
    }
}
