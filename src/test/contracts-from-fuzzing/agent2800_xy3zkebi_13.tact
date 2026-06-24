struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    m: Mixed;

    init() {
        self.m = Mixed{
            a:1,
            b:false,
            c:"x",
            d:null,
            e:true,
            f:null
        };
    }
}