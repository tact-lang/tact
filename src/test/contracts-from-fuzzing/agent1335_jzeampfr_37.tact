struct Strange {
    foo: Int as uint8;
    bar: Int as int4;
    baz: Int as uint1;
}

contract WeirdSerialization {
    s: Strange;

    init() {
        self.s = Strange{ foo: 10, bar: -3, baz: 1 };
    }
}