struct DeepOptional {
    inner: Int?;
    val: Int;
}

struct Container {
    nested: DeepOptional?;
    otherVal: Int;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            nested: DeepOptional{inner: null, val: 4},
            otherVal: 7
        };
    }
}