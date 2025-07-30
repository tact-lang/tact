struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
    m: Int;
    n: Bool;
    o: Int?;
    p: Bool?;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a:1, b:true, c:null, d:false,
            e:2, f:true, g:3, h:null,
            i:4, j:false, k:5, l:null,
            m:6, n:true, o:7, p:false
        };
    }
}