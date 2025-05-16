struct InnerMost2 {
    val: Int;
}

struct Middle2 {
    val: InnerMost2;
}

struct Outer2 {
    val: Middle2;
}

contract ChainStructs {
    data: Outer2;
    init() {
        self.data = Outer2{
            val: Middle2{
                val: InnerMost2{ val: 99 }
            }
        };
    }
}