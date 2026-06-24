struct Inner {
    bar: Int?; // optional int, default serialization
}

struct TopLevel {
    foo: Int as uint16; // should be stored as unsigned 16 bits
    inner: Inner?;    // optional nested struct
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            foo: 65535,
            inner: null
        };
    }
}