struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int = 2;
    e: Bool = false;
    f: String = "there";
    g: Int = 3;
    h: Bool = true;
    i: String = "foo";
    j: Int = 4;
    k: Bool = false;
    l: String = "bar";
}

contract ManyDefaults {
    big: BigStruct = BigStruct{};
    receive() {}
}
