struct AltSerialize {
    a: Int as coins;
    b: Int as uint16;
    c: Int as int64;
}

contract SerializeStruct {
    data: AltSerialize;
    init() {
        self.data = AltSerialize{
            a:10*pow(10,9),
            b:65535,
            c:-500000
        };
    }
}