struct Complex {
    optInt: Int?;
    optStruct: Inner?;
}

struct Inner {
    value: Int;
    nestedOpt: Int?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            optInt: null,
            optStruct: null
        };
    }

    receive() {
        self.data = Complex{
            optInt: 10,
            optStruct: Inner{ value: 3, nestedOpt: null }
        };
    }
}