struct S1 { x: Int; }
struct S2 { s1: S1; y: String; }
struct S3 { s2: S2; flag: Bool; }
struct S4 { s3: S3; label: String; }

contract FourNest {
    foo: S4;

    init() {
        self.foo = S4{ s3: S3{ s2: S2{ s1: S1{ x: 7 }, y: "yy" }, flag: true }, label: "lbl" };
    }
}