struct S1 {
    f1: Int;
    f2: Bool?;
}

struct S2 {
    subS1: S1;
    title: String?;
}

contract TestContract(
    s2param: S2,
    count: Int,
    name: String,
    flag: Bool?,
) {
    receive() {}
}
