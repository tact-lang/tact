struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int = 2;
    h: Bool = false;
    i: String = "y";
    j: Int?;
}

contract LargeStructTest {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            d: null,
            e: null,
            f: null,
            j: null
        };
    }
}