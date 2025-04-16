struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: Bool = false;
    e: String = "a";
    f: String = "b";
    g: Int = 3;
    h: Bool = true;
    i: Int = 4;
    j: Bool = false;
    k: String = "c";
    l: String = "d";
}

contract ManyFields {
    data: BigStruct = BigStruct{};

    init() {
        self.data = BigStruct{};
    }
}