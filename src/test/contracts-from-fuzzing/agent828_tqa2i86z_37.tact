message(0x1234) Payload {
    foo: Int;
    bar: Bool?;
}

struct Config {
    name: String;
    pay: Payload?;
}

contract TestContract(
    id: Int,
    data: Config,
    opt: Payload?,
) {}