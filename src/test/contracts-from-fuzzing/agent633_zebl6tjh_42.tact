struct AddressOnly {
    a: Address;
    b: Address?;
}

contract AddressInit {
    val: AddressOnly;

    init() {
        self.val = AddressOnly{
            a: myAddress(),
            b: null
        };
    }
}