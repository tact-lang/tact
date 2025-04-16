struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { z: Int? }

struct Combo {
    a: S1?;
    b: S2?;
    c: S3?;
}

contract ComboOpt {
    field: Combo;

    init() {
        self.field = Combo{
            a: null,
            b: null,
            c: null
        };
    }
}