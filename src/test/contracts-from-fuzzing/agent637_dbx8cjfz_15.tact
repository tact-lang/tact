// nesting struct in struct with optional string
struct S1 { s: String?; }
struct S2 { inner: S1; }

contract TestContract {
    nested: S2;

    init() {
        self.nested = S2{
            inner: S1{ s: null }
        };
    }
}