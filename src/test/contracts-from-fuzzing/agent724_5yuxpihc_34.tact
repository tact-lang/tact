struct Double {
    a: Int;
    b: Int;
}

contract StructInlineDefault {
    foo: Double = Double{a:1,b:2};

    init() {}
}