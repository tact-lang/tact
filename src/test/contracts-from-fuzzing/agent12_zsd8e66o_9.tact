struct Info {
    count: Int;
    flag: Bool;
    note: String;
}

contract TestContract(
    value: Int,
    status: Bool,
    info: Info,
    optInfo: Info?
) {
    receive() {
        // no-op, just for contract to be non-empty
    }
}