struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

contract FieldsMix {
    a: Int;
    b: Bool;
    c: String;
    d: S1;
    e: S2;
    f: S3;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "ok";
        self.d = S1{ x:10 };
        self.e = S2{ y:false };
        self.f = S3{ z:"z" };
    }
}