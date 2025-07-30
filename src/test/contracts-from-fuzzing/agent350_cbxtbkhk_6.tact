struct SerializedInts {
    a: Int as uint3;
    b: Int as uint7;
    c: Int as int5;
    d: Int as int17;
    e: Int;
}

contract SerializationTest {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a:7,
            b:100,
            c:-7,
            d:-10000,
            e:123456
        };
    }
}