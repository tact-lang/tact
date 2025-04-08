struct Info {
    addr: Address;
    ownerName: String;
    isActive: Bool;
}

contract TestContract {
    info: Info;

    init() {
        self.info = Info{
            addr: myAddress(),
            ownerName: "Alice",
            isActive: true,
        };
    }
}
