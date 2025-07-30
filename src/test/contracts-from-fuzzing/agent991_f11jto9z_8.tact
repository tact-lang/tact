struct LargeStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 42;
    h: Bool = false;
    i: String = "end";
}

contract DefaultStructPersist {
    ls: LargeStruct = LargeStruct{};
    init() {}
}