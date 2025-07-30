struct S1 { v1: Int; v2: Bool; }
struct S2 { f: S1; extra: Bool?; }
struct S3 { nested: S2; }

contract DoubleNested {
    s: S3;

    init() {
        self.s = S3{
            nested: S2{
                f: S1{ v1: 5, v2: true },
                extra: null
            }
        };
    }
}