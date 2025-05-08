struct Config {
    owner: Address;
    message: String;
}

contract AddressString {
    conf: Config;
    init() {
        self.conf = Config{
            owner: myAddress(),
            message: "owner is me"
        };
    }
}