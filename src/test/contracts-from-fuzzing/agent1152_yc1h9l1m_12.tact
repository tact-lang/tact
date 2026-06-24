struct Inner {
    intField: Int;
}

struct Container {
    innerOpt: Inner?;
    boolField: Bool;
}

contract Test {
    storage: Container;

    init() {
        self.storage = Container{
            innerOpt: Inner{intField:10},
            boolField: true
        };
    }
}