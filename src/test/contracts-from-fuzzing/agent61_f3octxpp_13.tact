struct S0 { f: Int }
struct S1 { f: S0 }
struct S2 { f: S1 }
struct S3 { f: S2 }
struct S4 { f: S3 }

contract LongNest {
    d: S4;

    init() {
        self.d = S4{ f: S3{ f: S2{ f: S1{ f: S0{ f: 99 } } } } };
    }
}