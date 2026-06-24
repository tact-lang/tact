struct Nested {
    val: Int;
    info: String;
}

contract TestContract(
    conf: Nested,
    count: Int as uint8,
    tag: String,
) {}