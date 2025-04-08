struct OptionalHolder {
    val: Int?;
}

contract OptionalField {
    st: OptionalHolder;

    init() {
        self.st = OptionalHolder{ val: null };
    }
}