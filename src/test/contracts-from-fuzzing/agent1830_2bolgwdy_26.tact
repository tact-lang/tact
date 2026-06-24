struct IntSerializationSizes {
    a: Int as int4;
    b: Int as uint5;
    c: Int as int257;
}

contract TestContract {
    data: IntSerializationSizes;

    init() {
        self.data = IntSerializationSizes{
            a: 3,
            b: 17,
            c: 999999999999999999999
        };
    }
}
