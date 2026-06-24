struct Config {
    admin: Address;
    tag: String?;
}

contract TestParamsConfig(
    conf: Config,
    id: Int
) {
    receive() {
        dump(self.conf.admin);
        dump(self.conf.tag);
    }
}