struct Simple {
    s: String;
    b: Bool;
    i: Int;
    o: Int?;
}

contract MultiVars {
    one: Simple;
    two: Simple;
    three: Simple;

    init() {
        self.one = Simple{ s:"a", b:true, i:1, o:null };
        self.two = Simple{ s:"b", b:false, i:2, o:3 };
        self.three = Simple{ s:"c", b:true, i:4, o:null };
    }
}