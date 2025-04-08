struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address?;
    h: Address?;
    i: Cell?;
    j: Cell?;
}

contract TestContract {
    s: BigStruct = BigStruct{
        a:1, b:true, c:null, d:null, e:"", f:null, g:null, h:null, i:null, j:null
    };
    init() {}
}