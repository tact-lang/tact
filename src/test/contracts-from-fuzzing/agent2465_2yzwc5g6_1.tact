struct DeepNest {
    sub: Mid;
}

struct Mid {
    val: Leaf;
}

struct Leaf {
    number: Int;
    note: String;
    active: Bool;
}

contract TestContract {
    info: DeepNest;

    init() {
        self.info = DeepNest{
            sub: Mid{
                val: Leaf{
                    number: 123,
                    note: "test",
                    active: true
                }
            }
        };
    }
}