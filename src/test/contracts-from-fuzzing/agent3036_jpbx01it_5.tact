struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MultipleBigStructs {
    s1: BigStruct;
    s2: BigStruct;

    init() {
        self.s1 = BigStruct{ a:1, b:true, c:"x", d:null, e:null, f:null };
        self.s2 = BigStruct{ a:2, b:false, c:"y", d:5, e:"test", f:true };
    }
}
