struct OptStruct {
    f: Int;
}

contract TestContract {
    val: OptStruct? = null;

    init() {
        self.val = OptStruct{f:42};
    }
}