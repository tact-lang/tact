struct AddressOpt {
    a: Address?;
}

contract ContainsAddressOpt {
    val: AddressOpt;

    init() {
        self.val = AddressOpt{ a: null };
    }
}
