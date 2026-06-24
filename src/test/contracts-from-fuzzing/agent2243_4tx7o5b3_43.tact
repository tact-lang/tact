struct Simple {
    a: Int;
    b: Bool;
}

contract OptionalSimpleStruct {
    val: Simple?;

    init() {
        self.val = null;
    }
}
