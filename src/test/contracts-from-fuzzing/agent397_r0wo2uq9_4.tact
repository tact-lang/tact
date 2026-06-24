struct Deep3 {
    val3: Int;
}

struct Deep2 {
    val2: Deep3;
}

struct Deep1 {
    val1: Deep2;
}

contract DeepChain {
    data: Deep1;

    init() {
        self.data = Deep1{
            val1: Deep2{
                val2: Deep3{
                    val3: 42
                }
            }
        };
    }
}