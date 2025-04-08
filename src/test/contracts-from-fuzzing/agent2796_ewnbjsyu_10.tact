struct DeepOne {
    nested: DeepTwo;
}

struct DeepTwo {
    nested: DeepThree;
}

struct DeepThree {
    nested: DeepFour;
}

struct DeepFour {
    nested: DeepFive;
}

struct DeepFive {
    x: Int;
    y: Bool;
}

contract Inception {
    d: DeepOne;

    init() {
        self.d = DeepOne{
            nested: DeepTwo{
                nested: DeepThree{
                    nested: DeepFour{
                        nested: DeepFive{
                            x: 42,
                            y: true
                        }
                    }
                }
            }
        };
    }
}