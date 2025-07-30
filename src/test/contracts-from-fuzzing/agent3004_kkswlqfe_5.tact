struct OptionalStruct {
    n: Int?;
    s: String?;
}

contract OptStructState {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct {
            n: null,
            s: null
        };
    }
}