struct ArgStruct {
    a: Int;
    b: Int;
}

struct ResStruct {
    sum: Int;
    product: Int;
}

contract GetterWithArgs {
    receive() {}

    // Getter with multiple parameters: a composite type and a primitive
    get fun calculate(arg: ArgStruct, factor: Int): ResStruct {
        let s: Int = arg.a + arg.b;
        return ResStruct { sum: s, product: s * factor };
    }
}
