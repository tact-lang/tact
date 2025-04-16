struct Customer {
    id: Int;
    vip: Bool;
}

contract OptionalStructParam(
    profile: Customer?
) {}
