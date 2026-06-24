struct DeepOptionals {
    nested: WithOptionals?;
}

struct WithOptionals {
    foo: Int?;
    bar: Bool?;
}

contract Test {
    deepOpt: DeepOptionals;

    init() {
        self.deepOpt = DeepOptionals{nested: WithOptionals{foo: 1, bar: false}};
    }
}