struct BigNested1 { f1: Int; }
struct BigNested2 { f2: BigNested1; }
struct BigNested3 { f3: BigNested2; }
struct BigNested4 { f4: BigNested3; }
struct BigNested5 { f5: BigNested4; }

contract BigNest {
    v: BigNested5;

    init() {
        self.v = BigNested5{
            f5: BigNested4{
                f4: BigNested3{
                    f3: BigNested2{
                        f2: BigNested1{ f1: 10 }
                    }
                }
            }
        };
    }
}