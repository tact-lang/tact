struct S4 { x: Int?; inner: S3?; }
struct S3 { y: Bool?; inner: S2?; }
struct S2 { z: String?; inner: S1?; }
struct S1 { t: Int?; }

contract SuperDeepOptionals {
    o: S4;

    init() {
        self.o = S4{
            x: 4,
            inner: S3{
                y: true,
                inner: S2{
                    z: "deepest",
                    inner: S1{
                        t: 42
                    }
                }
            }
        };
    }
}