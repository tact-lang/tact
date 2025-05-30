struct IntSerials {
    a: Int as uint3;
    b: Int as int4;
    c: Int as uint5;
}

contract SmallIntSerialContract {
    data: IntSerials;

    init() {
        self.data = IntSerials { a:7, b:-4, c:17 };
    }
}