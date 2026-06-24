struct OptionalStruct {
    inner: Int?;
}

contract OptStructInit {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{ inner: null };
    }
}
