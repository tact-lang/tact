struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    val: Inner;
    opt: Inner?;
}

struct Outer {
    mid: Middle;
    text: String;
}

contract StructChain {
    chain: Outer;

    init() {
        self.chain = Outer{
            mid: Middle{
                val: Inner{x: 5, y: false},
                opt: null,
            },
            text: "nested",
        };
    }
}