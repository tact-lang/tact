struct DeepInner {
    code: String?;
    valid: Bool;
}

struct Middle {
    deep: DeepInner?;
    value: Int;
}

contract TestContract {
    middle: Middle?;

    init() {
        self.middle = Middle{
            deep: DeepInner{
                code: "xyz",
                valid: true
            },
            value: 77
        };
    }
}