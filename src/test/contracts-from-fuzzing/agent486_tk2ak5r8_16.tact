struct AddressLayer1 {
    addr: Address;
    layer2: AddressLayer2;
}

struct AddressLayer2 {
    addr: Address;
    layer3: AddressLayer3;
}

struct AddressLayer3 {
    addr: Address;
}

contract TestAddressLayers {
    data: AddressLayer1;

    init() {
        let a = myAddress();
        self.data = AddressLayer1{
            addr:a,
            layer2: AddressLayer2{
                addr:a,
                layer3: AddressLayer3{
                    addr:a
                }
            }
        };
    }
}