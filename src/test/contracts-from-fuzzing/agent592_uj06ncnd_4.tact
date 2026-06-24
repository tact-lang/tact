struct BigStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: String;
    h: String;
    i: Int?;
    j: Bool;
    k: String;
    l: Int;
    m: Bool;
    n: Int;
    o: String;
}

contract ManyFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:2, d:false, e:3, f:true, g:"hi",
            h:"there", i:null, j:true, k:"end", l:9, m:false, n:42, o:"done"
        };
    }
}