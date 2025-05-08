struct LargeNested1 { a: Int; }
struct LargeNested2 { a: LargeNested1; }
struct LargeNested3 { a: LargeNested2; }
struct LargeNested4 { a: LargeNested3; }
struct LargeNested5 { a: LargeNested4; }

contract VeryDeep {
    payload: LargeNested5 = LargeNested5{
        a: LargeNested4{
            a: LargeNested3{
                a: LargeNested2{
                    a: LargeNested1{ a: 123 }
                }
            }
        }
    };

    init() {
        self.payload = LargeNested5{
            a: LargeNested4{
                a: LargeNested3{
                    a: LargeNested2{
                        a: LargeNested1{ a: 321 }
                    }
                }
            }
        };
    }
}