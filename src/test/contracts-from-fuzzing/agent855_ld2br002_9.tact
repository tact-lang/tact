struct S1 { a: Int; b: Bool }
struct S2 { c: Int?; d: S1 }
struct S3 { e: S2; f: String?; g: Bool }

contract MultiLevelMixed {
    s: S3;
    init() {
        self.s = S3{
            e: S2{c:null, d:S1{a:3,b:false}},
            f: "hello",
            g: true
        };
    }
}