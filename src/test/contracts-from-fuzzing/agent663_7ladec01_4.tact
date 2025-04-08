struct DeepOpt {
    foo: Int = 99;
    bar: Bool?;
}

struct OptContainer {
    inner: DeepOpt?;
    flag: Bool = true;
}

contract OptionalNested {
    s: OptContainer;

    init() {
        self.s = OptContainer{
            inner: DeepOpt{ foo: 42, bar: null },
            flag: false
        };
    }
}