struct Meta {
    title: String;
    active: Bool;
}

contract TestContract(
    a: Int,
    b: Bool,
    m: Meta,
    opt: Meta?,
) {
    receive() {}
}