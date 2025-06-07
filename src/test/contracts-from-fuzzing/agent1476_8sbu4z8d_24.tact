struct LongStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract LongStructStorage {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            a:1,
            b:true,
            c:null,
            d:"d",
            e:null,
            f:null,
            g:7,
            h:false,
            i:"i",
            j:2,
        };
    }
}