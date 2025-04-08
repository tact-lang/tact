message(0x2) OptInts {
    a: Int?;
    b: Int? as uint32;
    c: Bool?;
}

contract TestContract {
    rec: OptInts?;

    init() {
        self.rec = OptInts{
            a: null,
            b: null,
            c: null,
        };
    }
}