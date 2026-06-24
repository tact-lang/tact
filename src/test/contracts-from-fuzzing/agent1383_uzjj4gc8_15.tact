struct OptContained {
    val: Int;
    name: String;
}

contract OptionalsStruct {
    inner: OptContained?;

    init() {
        self.inner = OptContained{ val: 12, name: "yo" };
    }
}