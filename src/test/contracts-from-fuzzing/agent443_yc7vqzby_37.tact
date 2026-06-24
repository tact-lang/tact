struct SomeStruct {
    flag: Bool? = null;
}

contract OptionalDefaultNull {
    st: SomeStruct;

    init() {
        self.st = SomeStruct{};
    }
}