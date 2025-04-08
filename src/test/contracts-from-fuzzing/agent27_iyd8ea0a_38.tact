struct DeepOpt2 {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    c: Int?;
}

contract InceptionOpt {
    test: DeepOpt2;

    init() {
        self.test = DeepOpt2{
            a: null,
            b: InnerOpt{
                c: null
            }
        };
    }
}