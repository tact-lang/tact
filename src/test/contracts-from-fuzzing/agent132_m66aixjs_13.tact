// Struct with very many fields (stretch size)
struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: Int?;
    j: Bool?;
    k: String?;
    l: Int;
    m: Bool;
    n: String;
    o: Int?;
    p: Bool?;
}

contract WithBigStruct {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a:1, b:2, c:3, d:4, e:true, f:false, g:"g", h:"h",
            i:null, j:true, k:null, l:5, m:true, n:"n", o:42, p:null,
        };
    }
}