struct X {
    a: Int;
    b: Bool;
    c: String;
}

struct Y {
    a: Int;
    b: Bool;
    c: String;
}

struct Z {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    x: X;
    y: Y;
    z: Z;

    init() {
        self.x = X{ a:1, b:true,  c:"x" };
        self.y = Y{ a:2, b:false, c:"y" };
        self.z = Z{ a:3, b:true,  c:"z" };
    }
}