struct NestedWithAddressOptional {
    addr: Address?;
    tag: String;
}

struct OuterAddressStruct {
    inner: NestedWithAddressOptional?;
}

contract NestedAddressOptionalTest {
    state: OuterAddressStruct;
    init() {
        self.state = OuterAddressStruct{
            inner: NestedWithAddressOptional{
                addr: null,
                tag: "test"
            }
        };
    }
}