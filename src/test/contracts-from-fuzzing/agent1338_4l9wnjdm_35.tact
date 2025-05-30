struct HugeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract HugeStructContract {
    s: HugeStruct;
    init() {
        self.s = HugeStruct{
            a:1,
            b:true,
            c:"a",
            d:null,
            e:false,
            f:null,
            g:2,
            h:false,
            i:"b",
            j:null
        };
    }
}