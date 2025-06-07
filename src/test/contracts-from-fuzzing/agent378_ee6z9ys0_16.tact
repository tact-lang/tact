struct Ints {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int257;
}

contract TestContract {
    field: Ints;

    init() {
        self.field = Ints{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}