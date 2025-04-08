struct OptStruct {
    val: Int?;
}

contract OptionalRoot {
    s: OptStruct?;

    init() {
        self.s = null;
    }
}
