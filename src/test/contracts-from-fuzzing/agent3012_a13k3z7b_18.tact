struct AddressNest {
    addr: Address;
}

struct AddressWrap {
    a1: AddressNest;
    a2: AddressNest;
}

contract AddressWrapTest {
    val: AddressWrap;

    init() {
        self.val = AddressWrap{
            a1: AddressNest{ addr: myAddress() },
            a2: AddressNest{ addr: myAddress() }
        };
    }
}