struct S1 { x: Int; y: Bool; z: String }
struct S2 { a: S1; b: S1; c: Int }
struct S3 { m: S2; n: Bool; s: String }

contract ManyNested {
    s3: S3;

    init() {
        self.s3 = S3{
            m: S2{
                a: S1{ x: 1, y: true, z: "hi" },
                b: S1{ x: 2, y: false, z: "bye" },
                c: 100 },
            n: true,
            s: "ok"
        };
    }
}
