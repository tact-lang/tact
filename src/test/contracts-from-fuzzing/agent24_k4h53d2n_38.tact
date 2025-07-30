struct MixNestedOptionals {
    inner: MaybeInner?;
    f: Bool;
}

struct MaybeInner {
    text: String?;
    flag: Bool;
}

contract MixNestedOpt {
    data: MixNestedOptionals;

    init() {
        self.data = MixNestedOptionals{
            inner: null,
            f: false
        };
    }
}