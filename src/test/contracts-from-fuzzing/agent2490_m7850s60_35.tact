struct OptionalHolder {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalHolderContract {
    data: OptionalHolder?;

    init() {
        self.data = null;
    }
}