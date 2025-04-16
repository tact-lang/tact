struct S1 {
    x: Int;
}
struct S2 {
    y: S1;
}
struct S3 {
    z: S2;
}
contract TestContract{
    a: S3;
    b: S3;
    init() {
        self.a = S3{ z: S2{ y: S1{ x: 1 } } };
        self.b = S3{ z: S2{ y: S1{ x: 2 } } };
    }
    receive() {
        self.a.z.y.x = 3;
    }
}