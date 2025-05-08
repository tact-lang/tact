struct EmptyOptionStruct {
    a: Int?;
}

contract NullField {
    e: EmptyOptionStruct?;

    init() {
        self.e = null;
    }
}
