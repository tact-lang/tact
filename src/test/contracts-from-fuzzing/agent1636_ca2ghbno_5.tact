struct Deep {
    level: Int;
    deeper: DeepOpt?;
}

struct DeepOpt {
    name: String;
    value: Bool?;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{
            level: 1,
            deeper: DeepOpt{
                name: "hi",
                value: null
            }
        };
    }
}
