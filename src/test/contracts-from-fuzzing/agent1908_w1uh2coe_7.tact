struct DeepOne {
    v: Int;
}

struct DeepTwo {
    v: DeepOne;
}

struct DeepThree {
    v: DeepTwo;
}

struct DeepFour {
    v: DeepThree;
}

struct DeepFive {
    v: DeepFour;
}

contract FiveDeepNested {
    item: DeepFive;

    init() {
        self.item = DeepFive{
            v: DeepFour{
                v: DeepThree{
                    v: DeepTwo{
                        v: DeepOne{ v: 123 }
                    }
                }
            }
        };
    }
}