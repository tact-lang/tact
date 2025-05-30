struct FirstLayer {
    foo: SecondLayer;
}

struct SecondLayer {
    bar: ThirdLayer;
}

struct ThirdLayer {
    baz: FourthLayer;
}

struct FourthLayer {
    qux: Int;
}

contract FourDeep {
    nested: FirstLayer;
    init() {
        self.nested = FirstLayer{
            foo: SecondLayer{
                bar: ThirdLayer{
                    baz: FourthLayer{
                        qux: 99
                    }
                }
            }
        };
    }
}