struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Arranged {
    a: Int;
    b: Inner;
    c: Bool;
    d: Inner;
    e: String;
    init() {
        self.a = 1;
        self.b = Inner{x:2, y:true, z:"z"};
        self.c = false;
        self.d = Inner{x:3, y:false, z:"k"};
        self.e = "tail";
    }
}