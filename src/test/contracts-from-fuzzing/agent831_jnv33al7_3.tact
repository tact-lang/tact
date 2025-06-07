struct Complex {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    subStruct: Simple;
}

struct Simple {
    num: Int;
}

contract AllTypes {
    field: Complex;
    init() {
        self.field = Complex{
            foo: 1,
            bar: true,
            baz: "hello",
            addr: myAddress(),
            optInt: null,
            optBool: true,
            subStruct: Simple{ num: 42 }
        };
    }
}