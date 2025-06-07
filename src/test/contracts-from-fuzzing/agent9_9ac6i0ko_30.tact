struct OptionalSerialize {
    value: Int? as uint8;
}

contract ContractOptionalSerialize {
    s: OptionalSerialize = OptionalSerialize{ value: null };

    init() {
        self.s = OptionalSerialize{ value: 42 };
    }
}