struct DeepOpt {
    inner: String?;
}

struct Container {
    nested: DeepOpt?;
}

contract OptOpt {
    value: Container?;

    init() {
        self.value = Container{
            nested: DeepOpt{
                inner: null
            }
        };
    }
}