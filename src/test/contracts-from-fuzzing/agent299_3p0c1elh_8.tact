struct Sub {
    flag: Bool;
    txt: String;
}

contract OptionalStructFieldTest {
    maybeStruct: Sub?;
    init() {
        self.maybeStruct = null;
    }
}