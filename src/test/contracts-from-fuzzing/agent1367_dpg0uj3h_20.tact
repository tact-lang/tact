struct InnerOpt {
    a: Int?;
}

struct SecondLayer {
    inner: InnerOpt;
}

struct ThirdLayer {
    second: SecondLayer;
}

contract MultiDeep {
    st: ThirdLayer;

    init() {
        self.st = ThirdLayer{
            second: SecondLayer{
                inner: InnerOpt{
                    a: null,
                },
            },
        };
    }
}