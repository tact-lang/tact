struct Nested1 {
    val1: Int;
}

struct Nested2 {
    val2: Nested1;
}

struct Nested3 {
    val3: Nested2;
}

contract DeepChain {
    value: Nested3;

    init() {
        self.value = Nested3{
            val3: Nested2{
                val2: Nested1{
                    val1: 7
                }
            }
        };
    }
}