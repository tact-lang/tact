struct DeepOpt {
    inner: Int?;
}
struct Container {
    nested: DeepOpt?;
    val: Int;
}

contract TestContract {
    c: Container;
    init() {
        self.c = Container{ nested: null, val: 1 };
    }
}