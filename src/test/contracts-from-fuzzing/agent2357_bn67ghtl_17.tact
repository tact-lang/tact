struct OptBeforeReq {
    a: Int?;
    b: Int;
}

contract OptionalThenRequired {
    val: OptBeforeReq;

    init() {
        self.val = OptBeforeReq{ a: null, b: 5 };
    }
}
