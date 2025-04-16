struct AddressBag {
    owner: Address;
    admin: Address?;
    backup: Address?;
    note: String;
    count: Int;
}

contract TestContract {
    bag: AddressBag;

    init() {
        self.bag = AddressBag{
            owner: address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"),
            admin: null,
            backup: address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"),
            note: "test",
            count: 5
        };
    }
}