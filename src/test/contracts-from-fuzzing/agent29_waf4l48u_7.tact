struct OptStruct {
    a: Int;
    b: Cell;
}

contract OptionalStructField {
    opt: OptStruct?;
    init() {
        self.opt = null;
    }
}
