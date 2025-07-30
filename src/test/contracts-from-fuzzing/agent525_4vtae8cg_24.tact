struct Combo {
    a: Int;
    b: String;
    c: Bool;
}

contract StructDirect {
    cfield: Combo = Combo{a:1,b:"hi",c:true};

    init() {
        self.cfield = Combo{a:5,b:"abc",c:false};
    }
}