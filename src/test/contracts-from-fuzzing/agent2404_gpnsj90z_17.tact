struct S1 { x: Int; }
struct S2 { a: Int; s1: S1; }
struct S3 { y: String; s2: S2; }

contract PersistentContract {
    main: S3;
    init() {
        self.main = S3{
            y: "hello",
            s2: S2{
                a: 42,
                s1: S1{x: 7}
            }
        };
    }
}