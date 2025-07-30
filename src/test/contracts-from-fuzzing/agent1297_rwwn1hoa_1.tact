struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "abc";
    nested: NestedStruct = NestedStruct{
        a: 10,
        b: false,
        c: "xyz",
    };
    
    init() {}
}