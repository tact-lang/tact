struct Q {
    n: Int;
    txt: String?;
}

contract OptionalNestedStruct {
    data: Q?;

    init() {
        self.data = Q{
            n: 7,
            txt: "hello"
        };
    }

    receive() {
        if (self.data != null) {
            let _ = self.data!!.n;
        }
    }
}