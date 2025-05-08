struct OptionalBoolHolder {
    flag: Bool?;
}

contract BoolOpt {
    s: OptionalBoolHolder;

    init() {
        self.s = OptionalBoolHolder{ flag: true };
    }
}