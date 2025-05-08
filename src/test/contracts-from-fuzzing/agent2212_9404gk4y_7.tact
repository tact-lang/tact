struct Inner {
    x: Int;
    flag: Bool;
    text: String;
}

contract Test {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hi";
    optInt: Int? = null;
    optBool: Bool? = null;
    nested: Inner = Inner{x:1, flag:false, text:""};
}
