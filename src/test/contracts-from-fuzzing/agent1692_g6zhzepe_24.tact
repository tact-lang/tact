struct OptionalAddrInt {
    addr: Address?;
    val: Int?;
}

contract OptionalAddrIntStorage {
    data: OptionalAddrInt?;

    init() {
        self.data = null;
    }
}