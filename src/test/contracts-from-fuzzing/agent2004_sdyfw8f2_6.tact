struct LargeStruct {
    a: Int = 0;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = false;
    e: String = "hi";
    f: String? = null;
    g: Address? = null;
    h: Address? = null;
    i: Cell? = null;
    j: Slice? = null;
    k: String = "hello";
    l: Bool = false;
}

contract BigStorage {
    big: LargeStruct = LargeStruct{};
    init() {}
}
