struct S1 { a: Int = 1; }
struct S2 { s1: S1; b: Int = 2; }
struct S3 { s2: S2; c: Int = 3; }
struct S4 { s3: S3; d: Int = 4; }
struct S5 { s4: S4; e: Int = 5; }

contract Nested5 {
    value: S5;

    init() {
        self.value = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s1: S1{ a: 10 },
                        b: 20
                    },
                    c: 30
                },
                d: 40
            },
            e: 50
        };
    }
}