struct Embed {
    num: Int;
    optStr: String?;
    mapVal: map<Int, Bool>;
}

contract Combo {
    a: Int;
    b: Bool;
    c: String?;
    d: map<Int, Int>;
    e: Embed;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = emptyMap();
        self.e = Embed{ num: 42, optStr: null, mapVal: emptyMap() };
    }
    
    receive() {
        let _ = self.e;
    }
}