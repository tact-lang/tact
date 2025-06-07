struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract Test {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a:1, b:true, c:"a",
            d:2, e:false, f:"b",
            g:3, h:true, i:"c",
            j:4, k:false, l:"d",
        };
    }
}