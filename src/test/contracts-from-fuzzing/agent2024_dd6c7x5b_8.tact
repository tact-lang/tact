struct Basic {
    a: Int;
}

contract OptionalStruct {
    val: Basic?;

    init() {
        self.val = null;
    }
}