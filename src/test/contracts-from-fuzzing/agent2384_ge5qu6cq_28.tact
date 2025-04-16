struct DeepOne {
    x: Int;
}

struct DeepTwo {
    d: DeepOne;
}

struct DeepThree {
    d: DeepTwo;
}

contract VeryDeep {
    data: DeepThree;
    init() {
        self.data = DeepThree{d: DeepTwo{d: DeepOne{x:42}}};
    }
}