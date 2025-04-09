fun withTab(): String {
    return "Hello\tWorld";
}

contract Test {
    receive() {
        let x = withTab();
    }
}
