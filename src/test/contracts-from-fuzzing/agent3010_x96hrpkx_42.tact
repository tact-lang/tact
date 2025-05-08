struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract WideFieldMix {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a: 1, b: true, c: "x", d: null, e: null, f: null, g: 2, h: false, i: "y"
        };
    }
}
