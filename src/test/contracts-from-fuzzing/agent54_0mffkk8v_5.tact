struct L4 {
    val: Int;
}

struct L3 {
    nested: L4;
}

struct L2 {
    nested: L3;
}

struct L1 {
    nested: L2;
}

contract DeepChainTest {
    receive() {
        let chain = L1{
            nested: L2{
                nested: L3{
                    nested: L4{ val: 42 }
                }
            }
        };
        let result = chain.nested.nested.nested.val;
    }
}
