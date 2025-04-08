struct Wrap {
    num: Int;
}

contract OptionalOnContractField {
    data: Wrap?;

    init() {
        self.data = null;
    }
}