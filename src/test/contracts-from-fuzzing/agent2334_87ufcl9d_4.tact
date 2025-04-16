struct DeepOne { a: Int; }
struct DeepTwo { d1: DeepOne; }
struct DeepThree { d2: DeepTwo; }
struct DeepFour { d3: DeepThree; }
struct DeepFive { d4: DeepFour; }

contract DeepNest {
    payload: DeepFive;

    init() {
        self.payload = DeepFive{
            d4: DeepFour{
                d3: DeepThree{
                    d2: DeepTwo{
                        d1: DeepOne{ a: 42 }
                    }
                }
            }
        };
    }
}