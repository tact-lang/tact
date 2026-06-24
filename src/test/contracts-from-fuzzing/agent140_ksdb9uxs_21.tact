struct Addressed {
    addr: Address;
    maybeName: String?;
}

contract AddressStructOptional {
    who: Addressed;

    init() {
        self.who = Addressed{
            addr: myAddress(),
            maybeName: null,
        };
    }
}