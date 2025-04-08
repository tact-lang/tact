// Contract with large amount of nested struct fields combining various types
struct S1 { a: Int; b: Bool?; }
struct S2 { x: Int?; y: S1; }
struct S3 { s2: S2; msg: String; }

contract TestContract {
    val: S3;
    init() {
        self.val = S3{
            s2: S2{
                x: null,
                y: S1{
                    a: 999,
                    b: true,
                }
            },
            msg: "abc",
        };
    }
}
