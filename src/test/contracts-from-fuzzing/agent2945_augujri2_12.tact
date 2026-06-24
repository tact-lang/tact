struct Params {
    a: Int as int64;
    b: Int as uint16;
    c: Bool;
    d: Int? as uint8;
    e: Bool?;
}

contract SerializeOptions {
    p: Params;

    init() {
        self.p = Params{a: 1, b: 2, c: true, d: null, e: null};
    }
}