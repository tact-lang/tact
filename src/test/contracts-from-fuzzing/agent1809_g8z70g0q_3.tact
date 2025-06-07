struct OptStruct {
    x: Int;
    y: Int;
}

contract OptWrapper {
    val: OptStruct?;

    init() {
        self.val = null;
    }
}