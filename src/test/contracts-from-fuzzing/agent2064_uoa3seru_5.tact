struct LargeStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
}

contract BigFields {
    store: LargeStruct = LargeStruct{
        a: 0, b: "", c: false,
        d: 0, e: "", f: false,
        g: 0, h: "", i: false,
        j: 0, k: "", l: false
    };
}
