struct OptionalStruct {
    a: Int;
}

contract TestOptionalGetter {
    cond: Bool = false;

    receive() {}

    // Getter returning an optional struct based on a condition
    get fun getOptional(): OptionalStruct? {
        if (self.cond) {
            return OptionalStruct{ a: 100 };
        } else {
            return null;
        }
    }
}
