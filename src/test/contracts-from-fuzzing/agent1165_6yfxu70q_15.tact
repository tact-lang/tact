struct S1 { a: Int; b: Bool; }
struct S2 { c: S1; d: Int; }
struct S3 { e: S2; f: Bool; }

contract MultiNestOpt {
    nestedOpt: S3?;

    init() {
        self.nestedOpt = null;
    }
}
