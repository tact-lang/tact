struct S1 { v1: Int }
struct S2 { v2: Bool }
struct S3 { v3: Cell }
struct S4 { v4: Slice }
struct S5 { v5: Address }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            s1: S1{v1: 1},
            s2: S2{v2: true},
            s3: S3{v3: emptyCell()},
            s4: S4{v4: emptyCell().asSlice()},
            s5: S5{v5: myAddress()} 
        };
    }
}