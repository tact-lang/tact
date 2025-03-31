fun DoSomething(): String {
    return "Ok";
}

contract Test {
    receive() {
        let result = DoSomething();
    }
}
