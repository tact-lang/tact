struct OptAddress {
    a: Address?;
}

contract TestOptAddr {
    val: OptAddress;

    init() {
        self.val = OptAddress{ a:null };
    }
}