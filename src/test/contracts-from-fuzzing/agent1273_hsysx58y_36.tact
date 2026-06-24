struct Bottom {
    val: Int;
}

struct Middle {
    val: Bottom?;
}

struct Top {
    val: Middle?;
}

contract TestContract {
    nested: Top;

    init() {
        self.nested = Top{
            val: Middle{
                val: Bottom{
                    val: 999
                }
            }
        };
    }
}