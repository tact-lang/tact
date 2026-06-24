// Declare a very deep struct nesting chain
struct S4 { val: Int; }
struct S3 { nested: S4; }
struct S2 { nested: S3; }
struct S1 { nested: S2; }

contract DeepContract {
    data: S1;

    init() {
        self.data = S1{ nested: S2{ nested: S3{ nested: S4{ val: 42 } } } };
    }
}