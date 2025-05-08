struct SomeStruct {
    a: Int;
    b: String?;
}

contract OptionalStructInContract {
    s: SomeStruct?;

    init() {
        self.s = null;
    }
}
