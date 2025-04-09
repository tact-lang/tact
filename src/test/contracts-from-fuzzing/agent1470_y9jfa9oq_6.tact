struct Inner2 {
    val: String?;
}

struct Outer2 {
    wrap: Inner2?;
}

contract OptionalChain {
    chain: Outer2;

    init() {
        self.chain = Outer2{
            wrap: Inner2{
                val: "X",
            },
        };
    }
}