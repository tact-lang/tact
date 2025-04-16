struct NestedOptionalStruct {
    a: Int;
    b: Bool?;
}

contract OptStructField {
    s: NestedOptionalStruct? = null;
    receive() {
        let _ = self.s;
    }
}