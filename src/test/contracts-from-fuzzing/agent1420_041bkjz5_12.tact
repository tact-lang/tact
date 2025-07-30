struct LongStruct {
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

contract TestContract {
    ls: LongStruct = LongStruct{
        a:1, b:true, c:"hi", d:null, e:null, f:null, g:7, h:false, i:"yo"
    };
    init() {}
}