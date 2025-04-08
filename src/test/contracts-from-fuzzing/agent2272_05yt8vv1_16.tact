struct S {
    flag: Bool = true;
}

contract OptionalStructOptional {
    optStruct: S?;

    init() {
        self.optStruct = null;
    }
}