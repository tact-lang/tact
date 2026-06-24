struct S1 { val: Int; }
struct S2 { val: Int; nested: S1; }
struct S3 { nested: S2; }

contract ChainNested {
    s: S3;
    init() {
        self.s = S3{ nested: S2{ val: 5, nested: S1{ val: 123 } } };
    }
}
