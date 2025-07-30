struct MyStruct {
    a: Int;
    b: Bool?;
}

contract MyContractWithDefault {
    s: MyStruct = MyStruct{a: 5, b: null};
}