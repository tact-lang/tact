struct S1 { val: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }
struct S5 { s: S4 }
struct S6 { s: S5 }
struct S7 { s: S6 }
struct S8 { s: S7 }

contract DeepStructs {
    s: S8;
    init() {
        self.s = S8{ s: S7{ s: S6{ s: S5{ s: S4{ s: S3{ s: S2{ s: S1{ val: 42 } } } } } } } };
    }
}