struct SizeVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int;
}

contract VariantStruct {
    s: SizeVariants = SizeVariants{
        a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7
    };

    init() {}
}