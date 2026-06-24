struct DeepOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract Test {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}