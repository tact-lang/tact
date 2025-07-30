// Multiple structs with various optional fields, nested in a contract
struct S1 { a: Int?; b: Int; }
struct S2 { c: S1?; d: Bool; }
struct S3 { e: S2; f: String?; }

contract NestedStructMix {
    data: S3;
    init() {
        self.data = S3{
            e: S2{ c: null, d: false },
            f: null
        };
    }
}