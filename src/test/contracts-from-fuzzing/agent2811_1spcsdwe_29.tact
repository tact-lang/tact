struct ChildStruct {
    n:Int;
    b:Bool;
}

contract StructInits {
    field: ChildStruct = ChildStruct{n:42,b:true};
}