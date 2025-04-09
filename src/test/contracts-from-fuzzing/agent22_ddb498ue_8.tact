struct DeepOptional {
    value: Int?;
    nested: InnerOptional?;
}

struct InnerOptional {
    flag: Bool?;
    text: String?;
}

contract TestContract {
    store: DeepOptional;

    init() {
        self.store = DeepOptional{
            value: null,
            nested: InnerOptional{
                flag: null,
                text: "Deep"
            }
        };
    }
}
