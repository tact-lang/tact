struct S1 { f1: Int; }
struct S2 { f2: Bool; }
struct S3 { f3: Address; }
struct S4 { f4: String; }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

contract StructWithinStructs {
    combo: Combo;

    init() {
        self.combo = Combo{
            s1: S1{f1: 11},
            s2: S2{f2: true},
            s3: S3{f3: myAddress()},
            s4: S4{f4: "hi"}
        };
    }
}