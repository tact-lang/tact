// deeply nested large struct with many layers and rich optional & default mix
struct S1 { a: Int?; b: String = "d"; }
struct S2 { x: S1; y: Int; }
struct S3 { s: S2?; flag: Bool; }
struct S4 { nested: S3; extra: String?; }

contract BigNestMix {
    top: S4;

    init() {
        self.top = S4{
            nested: S3{
                s: null,
                flag:true
            },
            extra: null
        };
    }
}