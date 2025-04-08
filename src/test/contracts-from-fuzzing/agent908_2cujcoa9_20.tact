struct NestedOptAddr {
    contact: Address?;
}

contract OptAddrContract {
    data: NestedOptAddr?;

    init() {
        self.data = null;
    }
}