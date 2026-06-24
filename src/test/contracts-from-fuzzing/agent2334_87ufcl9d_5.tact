struct S1 { a: Int; b: Bool; c: String; }
struct S2 { a: Int?; b: Bool?; c: String?; }
struct S3 { a: S1; b: S2; }

contract NestedOptional {
    data: S3;

    init() {
        self.data = S3{
            a: S1{ a: 1, b: true, c: "hi" },
            b: S2{ a: null, b: null, c: null }
        };
    }
}