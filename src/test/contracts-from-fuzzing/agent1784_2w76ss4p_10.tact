struct FirstLayer {
    s: SecondLayer;
}

struct SecondLayer {
    t: ThirdLayer;
}

struct ThirdLayer {
    u: FourthLayer;
}

struct FourthLayer {
    v: Int;
    flag: Bool;
    text: String;
}

contract DeepStructs {
    val: FirstLayer;

    init() {
        self.val = FirstLayer{
            s: SecondLayer{
                t: ThirdLayer{
                    u: FourthLayer{ v: 123, flag: true, text: "ok" }
                }
            }
        };
    }
}