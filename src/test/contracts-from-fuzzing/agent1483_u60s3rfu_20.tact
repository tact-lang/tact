struct StructWithOptAddress {
    addr: Address?;
}

contract OptAddrTest {
    val: StructWithOptAddress;

    init() {
        self.val = StructWithOptAddress{addr: null};
    }
}