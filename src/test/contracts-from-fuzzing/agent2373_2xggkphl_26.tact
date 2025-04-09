struct Mixed {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract MixedOptionals {
    data: Mixed;

    init() {
        self.data = Mixed{a:1,b:null,c:true,d:null,e:"x",f:null};
    }
}