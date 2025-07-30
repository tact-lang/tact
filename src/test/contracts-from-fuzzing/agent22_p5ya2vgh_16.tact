struct TinyOptionals {
    a: Int? as uint1;
    b: Int? as uint4;
    c: Int? as uint8;
    d: Bool?;
    e: Bool?; 
}

contract TinyOptionalsPersist {
    flags: TinyOptionals;

    init() {
        self.flags = TinyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
