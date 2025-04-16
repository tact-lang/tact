struct IntStruct {
    x: Int;
    y: Int;
}

contract InitializedVar {
    point: IntStruct = IntStruct{ x: 5, y: 10 };
}