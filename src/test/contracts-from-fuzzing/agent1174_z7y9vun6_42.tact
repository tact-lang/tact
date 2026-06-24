struct IntNested {
    value: Int;
}

contract IntInStruct {
    s: IntNested = IntNested{ value: 123 };
}