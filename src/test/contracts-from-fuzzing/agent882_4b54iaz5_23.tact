struct SimpleStruct {
    val: Int;
}

contract OptionalSimpleStruct {
    s: SimpleStruct?;

    init() {
        self.s = null;
    }
}