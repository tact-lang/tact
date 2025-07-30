struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: Cell? = null;
    d: String = "hi";
    e: Int = 2;
    f: Bool = false;
    g: Cell? = null;
    h: String = "there";
    i: Int = 3;
    j: Bool = true;
}

contract TestContract {
    bigField: BigStruct = BigStruct{};
    init() {}
}