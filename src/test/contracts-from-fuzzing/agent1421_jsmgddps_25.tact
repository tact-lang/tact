struct BoolStruct {
    b: Bool;
}

contract BoolPersistent {
    b1: Bool = true;
    b2: Bool = false;
    nested: BoolStruct = BoolStruct{b: true};
}