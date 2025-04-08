struct Config {
    amount: Int as int64;
    counter: Int as uint8;
    enabled: Bool;
}

contract Configurable(
    cfg: Config,
    owner: Address
) {}