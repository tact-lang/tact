struct LayeredOptionals {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int;
    flag: Bool;
}

contract OptionalWithinOptional {
    data: LayeredOptionals;

    init() {
        self.data = LayeredOptionals { inner: null };
    }
}