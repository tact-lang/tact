struct InnerOpt {
    val: Int?;
}

contract OptOfStructOptField {
    field: InnerOpt?;
    init() {
        self.field = InnerOpt{val: null};
    }
}