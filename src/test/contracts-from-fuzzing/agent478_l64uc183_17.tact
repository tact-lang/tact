struct SerMix {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int1;
    d: Int as uint1;
    e: Int as int257;
}

contract SerialVariants {
    data: SerMix = SerMix{
        a:0, b:0, c:0, d:0, e:0
    };
}