struct OptionalBoolHolder {
    flag: Bool?;
}

contract TestUninitOptionalBool {
    field: OptionalBoolHolder;

    init() {
        self.field = OptionalBoolHolder{};
    }
}
