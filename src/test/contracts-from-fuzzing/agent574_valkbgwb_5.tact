struct Data {
    n: Int;
    txt: String;
}

contract OptionalStruct {
    optData: Data?;

    init() {
        self.optData = null;
    }

    receive() {
        if (self.optData != null) {
            dump(self.optData!!.n);
        }
    }
}