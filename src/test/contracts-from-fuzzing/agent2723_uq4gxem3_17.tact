struct SomeStruct {
    a: Int;
}

contract OptionalOuter {
    s: SomeStruct?;
    init() {
        self.s = null;
    }
}