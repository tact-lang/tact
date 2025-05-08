struct Small {
    a: Int;
}

contract OptionalContractField {
    val: Small?;

    init() {
        self.val = null;
    }
}
