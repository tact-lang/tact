struct S1 { f: Int }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
contract NestedState {
    a: Int;
    b: S3;
    c: Bool;
    init() {
        self.a = 2;
        self.b = S3{ s2: S2{ s1: S1{ f: 42 } } };
        self.c = true;
    }
}