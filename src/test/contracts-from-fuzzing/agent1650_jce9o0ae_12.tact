struct SLevel1 { a: Int; b: Bool; }
struct SLevel2 { s1: SLevel1; c: Int; }
struct SLevel3 { s2: SLevel2; d: Bool; }
struct SLevel4 { s3: SLevel3; e: Int; }

contract ComplexNested {
    data: SLevel4;

    init() {
        self.data = SLevel4 {
            s3: SLevel3 {
                s2: SLevel2 {
                    s1: SLevel1 { a:1, b:true }, c: 2
                },
                d: false
            },
            e: 3
        };
    }
}