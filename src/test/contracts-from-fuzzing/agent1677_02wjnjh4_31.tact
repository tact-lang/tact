struct Diverse {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestDiverse {
    val: Diverse = Diverse{a:1,b:null,c:true,d:null,e:"hi",f:null};

    init() {
        self.val.b=123;
        self.val.d=true;
        self.val.f="ok";
    }
}
