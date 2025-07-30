struct FirstLayer {
    a: Int = 1;
}

struct SecondLayer {
    b: FirstLayer;
}

struct ThirdLayer {
    c: SecondLayer;
}

struct FourthLayer {
    d: ThirdLayer;
}

contract NestedFourLayers {
    val: FourthLayer;

    init() {
        self.val = FourthLayer{
            d: ThirdLayer{
                c: SecondLayer{
                    b: FirstLayer{ a: 42 }
                }
            }
        };
    }
}