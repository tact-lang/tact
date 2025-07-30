struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: Int?; }

contract TestContract {
    x: S1;
    y: S2;
    z: S3;

    init() {
        self.x = S1{ a: 10 };
        self.y = S2{ b: true };
        self.z = S3{ c: null };
    }
}