struct BoolIntCombo {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
}

contract Interleaved {
    mixed: BoolIntCombo;

    init() {
        self.mixed = BoolIntCombo{
            a:true,
            b:1,
            c:false,
            d:2,
            e:true
        };
    }
}