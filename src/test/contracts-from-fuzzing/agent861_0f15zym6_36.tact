struct Compound {
    num: Int;
    text: String;
    flag: Bool;
}

contract MultiFieldStorage {
    a: Compound;
    b: Compound;
    c: Compound;

    init() {
        self.a = Compound{num:1,text:"a",flag:true};
        self.b = Compound{num:2,text:"b",flag:false};
        self.c = Compound{num:3,text:"c",flag:true};
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
    }
}