contract Self {

    init() { }

    receive() { }

    get fun testInitOfAddress(): Address {
        return contractAddress(initOf Self());
    }

    get fun testMyAddress(): Address {
        return myAddress();
    }
}

message ChildAddress {
    address: Address;
}

contract Child {

    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    receive() {
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            bounce: false, 
            body: ChildAddress { address: myAddress() }.toCell(),
        });
    }
}

contract Parent {

    childMyAddress: Address;

    init() {
      self.childMyAddress = myAddress();  // dummy value to be replaced by the child
    }

    receive() {
        let ci = initOf Child(myAddress());
        send(SendParameters {
            to: contractAddress(ci),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            bounce: false, 
            body: beginCell().endCell(),
            code: ci.code,
            data: ci.data,
        });
    }

    receive(msg: ChildAddress) {
        self.childMyAddress = msg.address;
    }

    get fun testInitOfAddressChild(): Address {
        return contractAddress(initOf Child(myAddress()));
    }

    get fun testMyAddressChild(): Address {
        return self.childMyAddress;
    }
}