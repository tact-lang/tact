struct S1 { 
    a: Int;
}

struct S2 {
    a: Int;
    b: Int;
}

struct S3 {
    a: Int;
    b: Bool;
}

contract VariousSimpleStructs {
    x: S1;
    y: S2;
    z: S3;

    init() {
        self.x = S1{a: 1};
        self.y = S2{a:2, b:3};
        self.z = S3{a:4, b:true};
    }
}