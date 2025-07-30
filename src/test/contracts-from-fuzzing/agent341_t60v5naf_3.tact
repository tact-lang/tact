struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract LargeStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a:1, b:true, c:"c", d:null, e:null, f:"f",
            g:7, h:false, i:"i", j:10
        };
    }
}