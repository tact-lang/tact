fun test_builder() : String {
    let b: StringBuilder = beginString();
    b.append("Hello,");
    b.append(" World!");
    return b.toString();
}

contract TestContract {
    receive() {
        test_builder();
    }
}
