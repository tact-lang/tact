struct DeepOne {
    x: Int;
    y: String?;
}

struct DeepTwo {
    a: Bool;
    b: DeepOne;
}

contract DeepContract {
    data: DeepTwo;
    
    init() {
        self.data = DeepTwo{
            a: true,
            b: DeepOne{ x: 42, y: "hi" }
        };
    }
}