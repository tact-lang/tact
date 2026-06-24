struct Info {
    m: Int;
    label: String;
}

contract TestContract(
    number: Int,
    flag: Bool,
    details: Info,
    meta: Info?,
) {
    receive() {}
}