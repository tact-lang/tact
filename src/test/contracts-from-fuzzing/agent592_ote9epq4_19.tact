struct DataA {
    a: Int;
}

struct DataB {
    b: Int;
}

contract TestContract(
    foo: DataA?,
    bar: DataB?,
) {
    receive() {}
}