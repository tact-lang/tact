struct Reordered {
    a: Int?;
    b: Int;
    c: Int?;
    d: Int;
    e: Int?;
}

contract FieldOrder {
    val: Reordered;

    init() {
        self.val = Reordered{
            a: null,
            b: 2,
            c: null,
            d: 4,
            e: null
        };
    }
}