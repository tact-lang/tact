struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: Int; }
struct S4 { d: Bool; }

contract TestContract {
    x: S1;
    y: S2;
    z: S3;
    w: S4;

    init() {
        self.x = S1{ a: 11 };
        self.y = S2{ b: true };
        self.z = S3{ c: 22 };
        self.w = S4{ d: false };
    }
}
