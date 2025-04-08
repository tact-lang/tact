struct OptInts {
    a: Int? as uint4;
    b: Int? as int8;
    c: Int? as uint12;
}

contract TestC {
    oi: OptInts;

    init() {
        self.oi = OptInts{ a: 5, b: null, c: 100 };
    }
}