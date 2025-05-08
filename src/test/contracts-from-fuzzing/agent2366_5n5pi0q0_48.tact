struct TestStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalFieldStructs {
    s1: TestStruct?;
    s2: TestStruct?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}