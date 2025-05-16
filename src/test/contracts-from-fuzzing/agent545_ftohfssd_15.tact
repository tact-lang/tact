struct MixedNested {
    n: Int;
    opt: Int?;
    txt: String;
    flag: Bool;
}

contract TestContract {
    a: MixedNested;
    b: MixedNested;
    c: MixedNested;
    d: MixedNested;

    init() {
        self.a = MixedNested{ n:1, opt:null, txt:"a", flag:true };
        self.b = MixedNested{ n:2, opt:10, txt:"b", flag:false };
        self.c = MixedNested{ n:3, opt:null, txt:"c", flag:true };
        self.d = MixedNested{ n:4, opt:20, txt:"d", flag:false };
    }

    receive() {}
}