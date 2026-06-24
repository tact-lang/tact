struct OptionalStruct {
    q: Int;
}

contract NullTopLevelOptional {
    st: OptionalStruct?;
    init() {
        self.st = null;
    }
}
