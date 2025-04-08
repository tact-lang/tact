struct S {
    a: Int;
    b: Bool;
    c: Int;
}

contract TestContract {
    x: S;
    y: S;
    z: S;

    init() {
        self.x = S{ a:1, b:true, c:2 };
        self.y = S{ a:3, b:false, c:4 };
        self.z = S{ a:5, b:true, c:6 };
    }
}