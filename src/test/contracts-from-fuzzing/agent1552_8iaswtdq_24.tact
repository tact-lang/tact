struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

contract DifferentMix {
    x: S1;
    y: S2;
    z: S3;

    init() {
        self.x = S1{a:11};
        self.y = S2{b:false};
        self.z = S3{c:"str"};
    }
}