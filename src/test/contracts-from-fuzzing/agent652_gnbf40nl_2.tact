struct DeeplyNested {
    inner: SecondLayer;
}

struct SecondLayer {
    third: ThirdLayer;
}

struct ThirdLayer {
    fourth: FourthLayer;
}

struct FourthLayer {
    deepestValue: Int;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: SecondLayer{
                third: ThirdLayer{
                    fourth: FourthLayer{
                        deepestValue: 42
                    }
                }
            }
        };
    }
}