struct RecA {
    val: Int;
}

struct RecB {
    val: RecA;
}

struct RecC {
    val: RecB;
}

struct RecD {
    val: RecC;
}

contract DeepRecursion {
    deep: RecD;

    init() {
        self.deep = RecD{
            val: RecC{
                val: RecB{
                    val: RecA{val: 999}
                }
            }
        };
    }
}