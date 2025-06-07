struct OptStruct {
    inner: Int;
}

contract OptionalStructs {
    sa: OptStruct?;
    sb: OptStruct?;
    sc: OptStruct?;

    init() {
        self.sa = null;
        self.sb = null;
        self.sc = null;
    }
    receive() {
        let _ = self.sa;
    }
}