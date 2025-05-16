struct OptStructField {
    val: Int;
}

contract OptStructCall {
    opt: OptStructField?;
    init() {
        self.opt = null;
    }
}