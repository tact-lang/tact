struct Combo {
    a: Int as int4;
    b: Int? as uint8;
    c: Int as int16;
    d: Int? as uint32;
    e: Bool?;
}

contract TestContract {
    data: Combo;

    init() {
        self.data = Combo{a:3, b:null, c:-3, d:null, e:null};
    }

    receive() {}
}