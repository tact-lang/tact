struct Embed {
    num:Int;
    flag:Bool;
}

contract ManyFieldsContract {
    a: Embed;
    b: Embed;
    c: Embed;
    d: Embed;
    e: Embed;
    init() {
        self.a = Embed{num:1, flag:true};
        self.b = Embed{num:2, flag:false};
        self.c = Embed{num:3, flag:true};
        self.d = Embed{num:4, flag:false};
        self.e = Embed{num:5, flag:true};
    }
}