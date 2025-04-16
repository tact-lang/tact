struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    msg: String?;
}

contract OptStructStorage {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct { foo: null, bar: null, msg: "hello" };
    }

    receive() {
        if (self.val.foo != null) {
            let _ = self.val.foo!! + 1;
        }
    }
}