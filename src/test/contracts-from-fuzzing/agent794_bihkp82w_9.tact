struct BigStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = true;
    f: Bool = false;
    g: String = "g";
    h: String = "h";
    i: Int? = null;
    j: Bool? = null;
    k: String? = null;
    l: Address? = null;
    m: Int = 13;
    n: Int = 14;
    o: Int = 15;
}

contract BigStructField {
    field: BigStruct = BigStruct{};
    init() {}
}