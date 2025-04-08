// struct with many optional of serialized ints
struct SerOptInts {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int16;
    d: Int? as uint16;
    e: Int? as int32;
    f: Int? as uint32;
}

contract OptionSerIntTest {
    val: SerOptInts;

    init() {
        self.val = SerOptInts{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}