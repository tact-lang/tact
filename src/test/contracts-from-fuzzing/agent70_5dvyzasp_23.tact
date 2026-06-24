struct HasBool {
    flag: Bool;
}

struct HasInnerOptional {
    inner: HasBool?;
}

contract Test {
    f: HasInnerOptional;

    init() {
        self.f = HasInnerOptional{
            inner: null
        };
    }
}