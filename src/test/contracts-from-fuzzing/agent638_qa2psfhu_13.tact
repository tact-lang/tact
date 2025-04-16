struct Node {
    val: Int = 5;
    label: String = "hi";
}

contract ParamWithDefaults(
    n: Node,
    comment: String?,
) {
    receive() {}
}