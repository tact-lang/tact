struct First {
    val: Int;
}

struct Second {
    data: Int;
}

contract TestContract(
    f: First,
    s: Second,
) {
    receive() {}
}