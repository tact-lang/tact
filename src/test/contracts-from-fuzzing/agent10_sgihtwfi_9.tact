struct OptionalStruct {
    a: Int as uint16;
    b: Bool?;
}

contract Test {
    receive() {
        let os = OptionalStruct { a: 99, b: true };
    }
}
