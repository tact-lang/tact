struct OptionalStruct {
    val: Int;
}

contract WithOptStruct {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}
