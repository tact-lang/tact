struct EmbedSerialize {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int8;
}

contract IntSerializeNested {
    val: EmbedSerialize = EmbedSerialize{a:1,b:-2,c:3,d:-4};
}