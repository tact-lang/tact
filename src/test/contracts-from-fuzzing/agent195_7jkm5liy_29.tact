struct S1 { a: Int; }
struct S2 { b: Int; c: Bool; }
struct S3 { d: String; e: Int?; }

contract Mix {
    x: S1;
    y: S2;
    z: S3;

    init() {
        self.x = S1{ a:1 };
        self.y = S2{ b:2, c:true };
        self.z = S3{ d:"three", e:null };
    }
}
