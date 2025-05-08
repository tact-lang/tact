struct MyType {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let x: MyType? = null;
    }
}