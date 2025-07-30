struct AddressOptDefault {
    a:Address?;
}

contract AddrOptDefault {
    data: AddressOptDefault;

    init() {
        self.data = AddressOptDefault{
            a:null
        };
    }
}