struct L3 {
    val3: Int;
    flag3: Bool;
}

struct L2 {
    val2: Int;
    inner3: L3;
}

struct L1 {
    val1: Int;
    inner2: L2;
}

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{
            val1: 1,
            inner2: L2{
                val2: 2,
                inner3: L3{
                    val3: 3,
                    flag3: true
                }
            }
        };
    }
}