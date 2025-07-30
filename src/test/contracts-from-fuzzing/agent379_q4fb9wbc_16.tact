struct DeepOpt {
    inner: Inner?;
}

struct Inner {
    innermost: Innermost?;
}

struct Innermost {
    num: Int;
}

contract ManyNestedOptionals {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{ inner: Inner{ innermost: Innermost{ num: -9 } } };
    }
}