struct OptStruct {
    val: Int;
}

contract OptStructHolder {
    field: OptStruct?;

    init() {
        self.field = null;
    }
}