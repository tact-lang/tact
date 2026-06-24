struct InnerMost {
    val: Int;
}

struct Inner {
    val: InnerMost;
}

struct Outer {
    val: Inner;
}

contract MultiNest {
    val: Outer;

    init() {
        self.val = Outer{
            val: Inner{
                val: InnerMost{
                    val: 123
                }
            }
        };
    }
}