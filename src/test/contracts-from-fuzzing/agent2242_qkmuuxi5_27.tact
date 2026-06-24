struct ExtremeNested1 { val: Int; }
struct ExtremeNested2 { val: ExtremeNested1; }
struct ExtremeNested3 { val: ExtremeNested2; }
struct ExtremeNested4 { val: ExtremeNested3; }
struct ExtremeNested5 { val: ExtremeNested4; }

contract FiveNest {
    bigNest: ExtremeNested5;

    init() {
        self.bigNest = ExtremeNested5{
            val: ExtremeNested4{
                val: ExtremeNested3{
                    val: ExtremeNested2{
                        val: ExtremeNested1{ val: 7 }
                    }
                }
            }
        };
    }
}