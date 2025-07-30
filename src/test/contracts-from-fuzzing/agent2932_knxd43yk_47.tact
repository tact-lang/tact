struct DeepOne {
    val: Int;
}

struct DeepTwo {
    one: DeepOne;
}

struct DeepThree {
    two: DeepTwo;
}

struct DeepFour {
    three: DeepThree;
}

contract DeepChain {
    chain: DeepFour;
    init() {
        self.chain = DeepFour{
            three: DeepThree{
                two: DeepTwo{
                    one: DeepOne{ val: 123 }
                }
            }
        };
    }
}