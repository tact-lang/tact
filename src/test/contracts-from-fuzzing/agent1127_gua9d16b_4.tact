struct BoolOptChain {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract BoolOptions {
    val: BoolOptChain;

    init() {
        self.val = BoolOptChain{
            a: true,
            b: null,
            c: false
        };
    }
}