struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract TestContract(
    param: NestedOpt?,
    number: Int
) {
    receive() {
        // Do nothing
    }
}