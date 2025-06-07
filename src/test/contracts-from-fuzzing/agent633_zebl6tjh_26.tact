struct SerializeMix {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;
}

contract SerializeMixHolder {
    m: SerializeMix = SerializeMix{
        a:4,b:8,c:16,d:32,e:64,f:128,g:256
    };
}