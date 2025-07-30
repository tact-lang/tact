struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract Test {
    a: S;
    b: S?;
    c: S?;
    init() {
        self.a = S{ x:1, y:true, z:"hi" };
        self.b = null;
        self.c = S{ x:2, y:false, z:"bye" };
    }
}