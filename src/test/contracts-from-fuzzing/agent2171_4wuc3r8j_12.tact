struct ManyBooleans {
    a: Bool;
    b: Bool;
    c: Bool?;
    d: Bool;
    e: Bool?;
}

contract BoolPacked {
    val: ManyBooleans;

    init() {
        self.val = ManyBooleans{
            a: true,
            b: false,
            c: null,
            d: true,
            e: false
        };
    }
}