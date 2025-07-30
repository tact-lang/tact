struct BigStruct {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "s";
    e: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f: Bool?;
    g: String?;
    h: Int?;
    i: Int as int32 = -7;
    j: Int as uint64 = 8;
}

contract FatContract {
    data: BigStruct = BigStruct{
        f: null,
        g: null,
        h: null
    };
}