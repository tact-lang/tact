struct AddressHolder {
    addr: Address;
}

struct Container {
    inner: AddressHolder;
}

contract HolderChainTest {
    val: Container;

    init() {
        self.val = Container {
            inner: AddressHolder {
                addr: myAddress()
            }
        };
    }
}
