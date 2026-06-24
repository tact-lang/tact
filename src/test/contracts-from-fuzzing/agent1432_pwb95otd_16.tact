struct Data {
    val: Int as uint16;
    flag: Bool;
}

contract TestContract(
    id: Int as uint32,
    enabled: Bool,
    data: Data,
) {}