struct BigNested1 {
    a: Int;
}
struct BigNested2 {
    a: BigNested1;
}
struct BigNested3 {
    a: BigNested2;
}
struct BigNested4 {
    a: BigNested3;
}
struct BigNested5 {
    a: BigNested4;
}
struct BigNested6 {
    a: BigNested5;
}
struct BigNested7 {
    a: BigNested6;
}
contract SevenDeep {
    deep: BigNested7;
    init() {
        self.deep = BigNested7{
            a: BigNested6{
                a: BigNested5{
                    a: BigNested4{
                        a: BigNested3{
                            a: BigNested2{
                                a: BigNested1{a:42}
                            }
                        }
                    }
                }
            }
        };
    }
}