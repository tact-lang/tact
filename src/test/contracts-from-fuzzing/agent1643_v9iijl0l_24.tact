struct OptionalStringField { val: String? }

contract ContractOptionalStringNested {
    f: OptionalStringField;

    init() {
        self.f = OptionalStringField{ val: null };
    }
}
