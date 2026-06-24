struct DeeplyOptional {
    innerOpt: Int?;
    innerText: String?;
}

struct ContainerOptional {
    nestedOpt: DeeplyOptional?;
    someFlag: Bool;
}

contract OptInsideOpt {
    payload: ContainerOptional;

    init() {
        self.payload = ContainerOptional{
            nestedOpt: DeeplyOptional{
                innerOpt: 42,
                innerText: "abc"
            },
            someFlag: false
        };
    }
}
