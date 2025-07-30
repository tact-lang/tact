struct SimpleStruct {
    a: Int;
    b: Int?;
}

contract StructFieldContract {
    data: SimpleStruct = SimpleStruct{a:1, b:null};
}