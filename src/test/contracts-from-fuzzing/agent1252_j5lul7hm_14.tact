struct SerializerDemo {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int;
}

contract SerializationContract {
    data: SerializerDemo;

    init() {
        self.data = SerializerDemo{
            a: 1000,
            b: 2000,
            c: -5,
            d: 3000
        };
    }
}
