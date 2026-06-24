struct OptStruct {
    val: Int;
    flag: Bool;
}

contract Test {
    s: OptStruct?;
    init() {
        self.s = null;
    }
}