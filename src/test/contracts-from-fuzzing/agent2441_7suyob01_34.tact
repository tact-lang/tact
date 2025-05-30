struct BigOptional {
    foo: Int?;
    bar: Int?;
    baz: Int?;
    qux: Int?;
}

struct ContainerOpt {
    inner: BigOptional?;
}

contract BigOptChain {
    val: ContainerOpt?;

    init() {
        self.val = null;
    }
}