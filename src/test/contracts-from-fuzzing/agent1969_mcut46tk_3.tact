struct OptionalInner {
    flag: Bool;
    n: Int?;
}

contract OptionalNested {
    field: OptionalInner;

    init() {
        self.field = OptionalInner{flag: true, n: null};
    }
}