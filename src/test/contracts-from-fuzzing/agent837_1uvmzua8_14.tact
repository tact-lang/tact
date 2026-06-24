struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Int;
    k: Bool?;
}

contract StructInception {
    x: BigStruct;
    y: BigStruct;
    init() {
        self.x = BigStruct{
            a: 1, b: true, c: null, d: false, e: "1", f: null, g:2, h:3, i:false, j:4, k:true,
        };
        self.y = BigStruct{
            a: 5, b: false, c: 6, d: null, e:"7", f:"8", g:9, h:null, i:true, j:10, k:false
        };
    }
}