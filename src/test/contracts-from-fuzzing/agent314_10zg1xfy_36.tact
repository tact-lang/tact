// optional struct with nested string and address fields
struct OptWithStrAddr {
    name: String?;
    addr: Address?;
}

contract OptionalStructSA {
    val: OptWithStrAddr?;
    init() {
        self.val = null;
    }
}