struct AddressHolder {
    address: Address;
}

struct OptionalHolder {
    nested: AddressHolder?;
}

contract OptInNestedAddress {
    val: OptionalHolder;

    init() {
        self.val = OptionalHolder{ nested: null };
    }
}
