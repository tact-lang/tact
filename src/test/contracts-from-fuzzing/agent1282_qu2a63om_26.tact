// Combine optional nested struct + primitive
struct NestOption {
    nest: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionPrimitiveMix {
    foo: NestOption;
    intVal: Int;

    init() {
        self.foo = NestOption{nest: null};
        self.intVal = 42;
    }
}
