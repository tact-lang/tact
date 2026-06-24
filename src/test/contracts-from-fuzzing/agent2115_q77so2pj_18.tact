// contract using contract parameters + nested struct as param
struct Config {
    x: Int;
    y: Bool;
}

contract ParamStruct(
    conf: Config,
    label: String,
    addr: Address?,
    coins: Int as coins,
) {}