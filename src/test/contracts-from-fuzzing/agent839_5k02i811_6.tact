struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool?;
    g: String;
    h: String?;
}

contract UsesBigStruct {
    data: BigStruct;
    dataOpt: BigStruct?;
    init() {
        self.data = BigStruct{
            a: 1, b: 2, c: 3, d: 4, e: true, f: null, g: "hello", h: null
        };
        self.dataOpt = null;
    }
}