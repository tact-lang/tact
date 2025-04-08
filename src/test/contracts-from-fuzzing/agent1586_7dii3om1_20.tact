struct Info {
    id: Int as uint64;
    name: String;
}

contract TestContract(
    mainId: Int as uint128,
    flag: Bool,
    label: String,
    meta: Info?,
) {
    receive() {}
}