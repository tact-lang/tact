struct Config {
    admin: Address;
    enabled: Bool = true;
}

contract ParamNested(
    conf: Config,
) {}
