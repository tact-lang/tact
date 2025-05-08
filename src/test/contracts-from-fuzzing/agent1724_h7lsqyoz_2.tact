struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct DeepOptional {
    inner: NestedOptional?;
    text: String?;
    number: Int?;
    flag: Bool?;
}

contract TestContract {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{
            inner: null,
            text: null,
            number: null,
            flag: null
        };
    }
}
