struct S1 {
    a: Int;
    b: Bool = true;
    c: String?;
}

struct S2 {
    x: Int?;
    y: String = "default";
    z: Bool?;
}

contract MegaTest {
    f1: S1;
    f2: S2;
    f3: S1?;
    f4: S2?;

    init() {
        self.f1 = S1 { a: 42, c: null };
        self.f2 = S2 { x: null, z: true };
        self.f3 = null;
        self.f4 = null;
    }
}