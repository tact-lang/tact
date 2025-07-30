struct DeepB {
    val1: Int;
    val2: String;
    opt: Bool?;
}

struct DeepA {
    id: Int;
    inner: DeepB;
}

contract DeepNest {
    var: DeepA;

    init() {
        self.var = DeepA{
            id: 5,
            inner: DeepB{
                val1: 10,
                val2: "x",
                opt: null,
            },
        };
    }
}