struct NN {
    val: Int;
}

struct MM {
    first: NN;
    second: NN?;
}

contract OptChain {
    m: MM?;

    init() {
        self.m = MM{
            first: NN{val: 5},
            second: null
        };
    }
}