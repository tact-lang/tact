struct OptionalAddressStruct {
    a: Int;
    addr: Address?;
}

contract TestContract {
    val: OptionalAddressStruct;

    init() {
        self.val = OptionalAddressStruct{
            a: 1,
            addr: null,
        };
    }
}