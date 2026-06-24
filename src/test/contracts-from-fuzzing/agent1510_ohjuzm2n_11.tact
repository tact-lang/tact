struct Sub {
    a: Int as int8;
    b: Bool;
}

struct Mixed {
    intFull: Int;
    intSmall: Int as uint4;
    optInt: Int?;
    optBool: Bool?;
    nested: Sub;
    addr: Address?;
}

contract TestContract {
    storage: Mixed = Mixed{
        intFull: 0,
        intSmall: 0,
        optInt: null,
        optBool: null,
        nested: Sub{a: 0, b: false},
        addr: null
    };

    init() {
        self.storage = Mixed{
            intFull: 123,
            intSmall: 7,
            optInt: null,
            optBool: null,
            nested: Sub{a: -8, b: true},
            addr: null
        };
    }

    receive() {
        let _ = self.storage;
    }
}