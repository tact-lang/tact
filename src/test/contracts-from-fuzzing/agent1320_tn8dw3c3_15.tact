struct SeqInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
    h: Int as int64;
}

contract SeqIntTest {
    data: SeqInts = SeqInts{
        a:1,b:2,c:3,d:4,e:-1,f:-2,g:-3,h:-4
    };

    receive() {
        self.data = SeqInts{
            a:255,b:65535,c:4294967295,d:18446744073709551615,
            e:127,f:32767,g:2147483647,h:9223372036854775807
        };
    }
}