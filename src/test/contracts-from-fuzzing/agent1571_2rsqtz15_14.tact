struct S1 { a: Int; b: Bool; c: String; }
struct S2 { x: Int; y: S1; }
struct S3 { m: S2; n: S1; z: String; }

contract Test14 {
    st: S3;

    init() {
        self.st = S3{
            m: S2{
                x: 11,
                y: S1{ a:1, b:true, c:"abc" }
            },
            n: S1{ a:2, b:false, c:"def" },
            z: "hi"
        };
    }
}
