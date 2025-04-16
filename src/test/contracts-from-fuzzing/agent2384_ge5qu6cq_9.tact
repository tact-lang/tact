struct Params {
    a: Int;
    b: Bool;
}

contract ParamOrder(
    b: Bool,
    a: Int,
) {
    // Out-of-order init via deployment params; test param serialization order
}