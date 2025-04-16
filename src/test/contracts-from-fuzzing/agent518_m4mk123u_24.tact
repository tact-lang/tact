struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 { z: Int; }
struct S4 { name: String; }
struct S5 { flag: Bool; }

struct ComplexOpt {
    s1: S1?;
    s2: S2?;
    s3: S3?;
    s4: S4?;
    s5: S5?;
}

contract FiveOptionalsInOne {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            s1: null,
            s2: null,
            s3: null,
            s4: null,
            s5: null,
        };
    }
}