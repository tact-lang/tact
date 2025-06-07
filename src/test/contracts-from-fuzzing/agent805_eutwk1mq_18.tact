struct Leaf {
    val: Int?;
    label: String;
}

struct Branch {
    leaf: Leaf?;
    name: String;
}

contract TestContract(
    state: Branch,
) {
    receive() {}
}