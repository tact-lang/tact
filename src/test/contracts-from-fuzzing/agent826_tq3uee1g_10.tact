struct S0 { a: Int }
struct S1 { x: S0 }
struct S2 { x: S1 }
struct S3 { x: S2 }
struct S4 { x: S3 }
struct S5 { x: S4 }

contract VeryDeep {
    testField: S5;

    init() {
        self.testField = S5{
            x:S4{
                x:S3{
                    x:S2{
                        x:S1{
                            x:S0{a:42}
                        }
                    }
                }
            }
        };
    }
}