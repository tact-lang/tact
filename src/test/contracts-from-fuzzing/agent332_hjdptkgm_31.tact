struct AddressNest {
    a1: Address;
    a2: Address?;
}

struct Wrap {
    inner: AddressNest;
}

contract TestContract {
    storage: Wrap;

    init() {
        self.storage = Wrap{
            inner: AddressNest{
                a1: myAddress(),
                a2: null
            }
        };
    }
}