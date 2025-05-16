// Structs with large number of nested optionals and default values
struct S1 { a: Int?; b: Bool?; }
struct S2 { s1: S1?; x: Int; }
struct S3 { s2: S2?; y: Bool; }
struct S4 { s3: S3?; z: Int; }
struct S5 { s4: S4?; flag: Bool; }

contract TestContract {
    largeNest: S5;

    init() {
        self.largeNest = S5{
            s4: S4{
                s3: S3{
                    s2: null,
                    y: false,
                },
                z: 0,
            },
            flag: true,
        };
    }
}
