struct OptInner {
    val: Int?;
}

contract ContractOptInner {
    field: OptInner;

    init() {
        self.field = OptInner{ val: null };
    }
}