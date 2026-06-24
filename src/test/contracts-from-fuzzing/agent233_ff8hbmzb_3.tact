struct DeepNested {
    f1: Int;
    f2: Bool;
}

contract OptStructField {
    data: DeepNested?;

    init() {
        self.data = null;
    }

    receive() {
        if (self.data != null) {
            let _ = self.data!!.f1;
        }
    }
}