struct OptionalAddressStruct {
    a: Address?;
    b: Address?;
    c: Address?;
}

contract OptionalAddressTest {
    addrs: OptionalAddressStruct;

    init() {
        self.addrs = OptionalAddressStruct{
            a:null,b:null,c:null
        };
    }
}