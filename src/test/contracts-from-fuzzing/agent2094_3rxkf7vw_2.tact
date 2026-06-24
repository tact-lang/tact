struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    inner: InnerStruct = InnerStruct{ val1: 1, val2: true };
    receive() {}
}
