struct DeepOne {
    s: String;
}

struct DeepTwo {
    foo: DeepOne;
}

contract DeepChain {
    val: DeepTwo;
    init() {
        self.val = DeepTwo{ foo: DeepOne{ s: "x" } };
    }
}