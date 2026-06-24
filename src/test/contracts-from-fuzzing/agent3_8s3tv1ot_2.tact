fun strTest(): String {
    return "Hello World!";
}

contract Test {
    receive() {
        let x = strTest();
    }
}
