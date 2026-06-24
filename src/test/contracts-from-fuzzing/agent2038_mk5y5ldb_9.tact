struct OptDeep {
    innerOpt: Nested?;
}

struct Nested {
    s: Inner;
}

struct Inner {
    x: Int; y: Int;
}

contract C {
    d: OptDeep;

    init() {
        self.d = OptDeep{innerOpt: Nested{s: Inner{x:1,y:2}}};
    }
}