struct S1 { x: Int; y: Int; z: Int; }
struct S2 { s1: S1; flag: Bool; }
struct S3 { s2: S2; num: Int?; }

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            s2: S2{ s1: S1{ x: 1, y: 2, z: 3 }, flag: false },
            num: null
        };
    }
}