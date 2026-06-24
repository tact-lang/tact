struct SerOrder {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int16;
    d: Int as uint2;
}

contract Fuzz22 {
    foo: SerOrder;

    init() {
        self.foo = SerOrder{
            a:-5,b:3,c:123,d:2
        };
    }
}