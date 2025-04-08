struct OptStruct {
    x: Int;
}

contract OptStructField {
    maybe: OptStruct?;

    init() {
        self.maybe = null;
    }

    receive() {
        let _ = self.maybe;
    }
}