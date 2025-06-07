struct Inner {
    a: Int as uint8;
    b: Int?;
    s: String;
}

struct Wrapper {
    inner1: Inner?;
    inner2: Inner?;
    x: Int as int64;
    y: Int;
}

contract TestContract {
    prop1: Wrapper;
    prop2: Wrapper;

    init() {
        self.prop1 = Wrapper{
            inner1: null,
            inner2: null,
            x: 33,
            y: 44
        };
        self.prop2 = Wrapper{
            inner1: null,
            inner2: null,
            x: 35,
            y: 55
        };
    }
}