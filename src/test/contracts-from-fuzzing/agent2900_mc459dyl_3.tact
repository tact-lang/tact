struct OptStruct {
    f1: Int;
    f2: Bool;
}

struct Holder {
    maybeInner: OptStruct?;
    s: String;
}

contract OptionalNested {
    storage: Holder;

    init() {
        self.storage = Holder{
            maybeInner: null,
            s: "hello",
        };
    }
}
