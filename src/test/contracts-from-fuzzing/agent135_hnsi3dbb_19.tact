struct S1 { a: Int; }
struct S2 { a: Bool; }
struct S3 { a: String; }
struct Combo {
    x: S1;
    y: S2;
    z: S3;
}

contract Test {
    c: Combo;

    init() {
        self.c = Combo{
            x: S1{a:1}, y: S2{a:true}, z: S3{a:"zz"}
        };
    }
}