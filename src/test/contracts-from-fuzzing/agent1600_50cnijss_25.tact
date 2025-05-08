struct Inner {
    note: String?;
    flag: Bool;
}

contract TestContract(
    param: Inner?
) {
    receive() {
        // dummy
    }
}