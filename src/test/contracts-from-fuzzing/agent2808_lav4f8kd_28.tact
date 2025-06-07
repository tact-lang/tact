struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract Test {
    x: Int;
    y: Bool;
    z: Inner;
    init() {
        self.x = 7;
        self.y = false;
        self.z = Inner{a:1,b:true,c:null};
    }
}