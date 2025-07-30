struct IntStruct {
    a: Int;
    b: Int;
}

contract DefaultsNested {
    x: IntStruct = IntStruct{a:1,b:2};
    y: IntStruct = IntStruct{a:3,b:4};

    init() {}
}
