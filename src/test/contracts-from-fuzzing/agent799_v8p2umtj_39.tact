// variants of serialization
struct SerializedInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;
}

contract VariousSerialization {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}