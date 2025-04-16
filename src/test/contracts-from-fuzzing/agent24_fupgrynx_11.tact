struct SOpt {
    s: Int?;
}

contract TestNullableField {
    opt: SOpt?;

    init() {
        self.opt = null;
    }
}