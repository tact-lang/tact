struct DeepNestOptional {
    a: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    text: String?;
}

contract NestedOptionals {
    data: DeepNestOptional;

    init() {
        self.data = DeepNestOptional{
            a: 77,
            inner: InnerOpt{
                flag: true
            }
        };
    }
}