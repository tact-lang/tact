struct DeepOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    content: ContentOpt?;
}

struct ContentOpt {
    number: Int;
    text: String?;
}

contract Test {
    field: DeepOpt;

    init() {
        self.field = DeepOpt{
            nested: InnerOpt{
                flag: true,
                content: null
            }
        };
    }
}