// Very deep nested structs with lots of optionals filled null
struct S4 { f: Int?; g: Bool?; }
struct S3 { sub: S4; }
struct S2 { sub: S3; }
struct S1 { sub: S2; }

contract VeryDeepNull {
    val: S1;

    init() {
        self.val = S1{
            sub: S2{
                sub: S3{
                    sub: S4{ f: null, g: null }
                }
            }
        };
    }
}