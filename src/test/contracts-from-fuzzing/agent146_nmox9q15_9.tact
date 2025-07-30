struct EncodedInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int257;
}

contract TestContract {
    enc: EncodedInts = EncodedInts{
        a:5,
        b:-120,
        c:100000,
        d:-3456789,
        e:12345678901234567890
    };
    
    receive(){}
}