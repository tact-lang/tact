struct S1 { val: Int }
struct S2 { nest: S1 }
struct S3 { nest: S2 }
struct S4 { nest: S3 }
struct S5 { nest: S4 }
struct S6 { nest: S5 }

contract Test {
    deep: S6;

    init() {
        self.deep = S6{
            nest: S5{
                nest: S4{
                    nest: S3{
                        nest: S2{
                            nest: S1{ val: 9 }
                        }
                    }
                }
            }
        };
    }
}