struct DeepOpt {
    foo: Int?;
    bar: DeepOpt2;
}

struct DeepOpt2 {
    baz: Bool?;
    msg: String?;
}

contract Test23 {
    dd: DeepOpt;
    init() {
        self.dd = DeepOpt{
            foo: null,
            bar: DeepOpt2{ baz: true, msg: null }
        };
    }
}
