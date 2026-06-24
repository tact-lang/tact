struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }
struct Combo {
    a: S1;
    b: S2;
    c: S3;
    flag: Bool?;
}

contract ComboTest {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: S1{ x: 1 },
            b: S2{ y: false },
            c: S3{ z: "hello" },
            flag: null,
        };
    }
}