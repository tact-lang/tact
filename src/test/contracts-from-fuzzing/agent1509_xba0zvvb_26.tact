struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }
struct S5 { s: S4 }

contract DeepFive {
    deep: S5;
    init() {
        self.deep = S5{ s: S4{ s: S3{ s: S2{ s: S1{ a: 999 } } } } };
    }
    receive() {
        let _ = self.deep.s.s.s.s.a;
    }
}