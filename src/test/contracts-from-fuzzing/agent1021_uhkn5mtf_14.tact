// Compose struct with address and string defaults
struct Info {
    who: String = "anon";
    addr: Address;
}

contract ConstAndField {
    info: Info;

    init() {
        self.info = Info{
            addr: myAddress(),
        };
    }
}