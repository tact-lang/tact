struct ExampleStruct {
    a: Int;
    b: Int;
}

contract DefaultInitialized {
    x: ExampleStruct = ExampleStruct{ a: 1, b: 2 };
    y: Int = 3;
}