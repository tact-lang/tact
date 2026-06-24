struct Compose {
    a: Int;
    b: Bool;
    s: String;
}

contract MultiInit {
    var1: Compose;
    var2: Compose;
    var3: Compose;

    init() {
        self.var1 = Compose{a:1, b:true, s:"a"};
        self.var2 = Compose{a:2, b:false, s:"b"};
        self.var3 = Compose{a:3, b:true, s:"c"};
    }
}