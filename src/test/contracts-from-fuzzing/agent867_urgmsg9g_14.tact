struct Inner {
    val: Int;
}

struct Middle {
    val: Inner;
}

struct Outer {
    val: Middle;
}

struct Top {
    val: Outer;
}

contract Chain {
    big: Top;
    init() {
        self.big = Top{
            val: Outer{
                val: Middle{
                    val: Inner{ val: 999 }
                }
            }
        };
    }
}