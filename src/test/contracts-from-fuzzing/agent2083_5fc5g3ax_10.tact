struct S1 { x: Int; }
struct S2 { s1: S1; y: Bool; }
struct S3 { s2: S2; z: String; }

contract Composition {
    c: S3;

    init() {
        self.c = S3{
            s2: S2{
                s1: S1{ x: 123 },
                y: true,
            },
            z: "hello",
        };
    }
}
