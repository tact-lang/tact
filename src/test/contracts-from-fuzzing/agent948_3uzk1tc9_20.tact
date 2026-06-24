struct NodeA {
    val1: Int;
    val2: Int;
}

struct NodeB {
    nestedA: NodeA;
    val3: Int;
}

struct NodeC {
    nestedB: NodeB;
    val4: Int;
    extra: String;
}

contract ComposeTest {
    data: NodeC;

    init() {
        self.data = NodeC{
            nestedB: NodeB{
                nestedA: NodeA{
                    val1: 111,
                    val2: 222
                },
                val3: 333
            },
            val4: 444,
            extra: "eee"
        };
    }
}