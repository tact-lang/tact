struct MixSerialize {
    a: Int as int4;
    b: Int as uint7;
    c: Int as int33;
    d: Int? as uint64;
    e: Int? as int8;
}

contract MixedSerializeCon {
    val: MixSerialize;

    init() {
        self.val = MixSerialize{
            a: 1,
            b: 2,
            c: 3,
            d: null,
            e: null
        };
    }
}