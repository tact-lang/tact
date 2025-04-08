struct DeepOpt {
    foo: Int as int64;
    bar: Int? as uint8;
}

struct Wrap {
    inner: DeepOpt?;
}

contract SerializeNest {
    nested: Wrap?;

    init() {
        self.nested = null;
    }
}