struct BoolLayer {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolFields {
    val: BoolLayer;

    init() {
        self.val = BoolLayer{
            a: true,
            b: null,
            c: false,
            d: null,
        };
    }
}
