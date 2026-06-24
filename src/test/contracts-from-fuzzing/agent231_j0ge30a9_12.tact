struct MaybeStruct {
    v: Int;
}

contract OptionalNestedStructPersist {
    s: MaybeStruct?;

    init() {
        self.s = null;
    }
}