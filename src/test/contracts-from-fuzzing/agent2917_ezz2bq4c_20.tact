struct OptionalStringHolder {
    s: String?;
}

contract StructHasOptionalString {
    hold: OptionalStringHolder;

    init() {
        self.hold = OptionalStringHolder{s: null};
    }
}
