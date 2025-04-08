struct X {
    a: Int;
}

contract OptionalOfStruct {
    value: X?;

    init() {
        self.value = null;
    }
}