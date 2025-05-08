struct S1 { a: Int; }
struct S2 { b: Int?; }
struct S3 { c: Bool; }

struct Nested {
    first: S1;
    second: S2;
    third: S3?;
}

contract Test {
    val: Nested?;

    init() {
        self.val = null;
    }
}