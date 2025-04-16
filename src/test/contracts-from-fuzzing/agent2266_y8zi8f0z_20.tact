struct X {
    a: Int;
    b: Bool;
    c: String;
}

struct Y {
    d: Int?;
    e: Bool;
    f: String?;
}

struct Z {
    x: X;
    y: Y;
}

contract Test {
    z: Z;

    init() {
        self.z = Z{
            x: X{a:1, b:true, c:"abc"},
            y: Y{d:null, e:false, f:"def"},
        };
    }
}
