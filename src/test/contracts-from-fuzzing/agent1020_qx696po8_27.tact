struct ManyAddresses {
    a: Address; b: Address; c: Address; d: Address;
    e: Address; f: Address; g: Address; h: Address;
}

contract ManyAddressesTest {
    data: ManyAddresses;

    init() {
        let addr = myAddress();
        self.data = ManyAddresses{
            a:addr,b:addr,c:addr,d:addr,e:addr,f:addr,g:addr,h:addr
        };
    }
}