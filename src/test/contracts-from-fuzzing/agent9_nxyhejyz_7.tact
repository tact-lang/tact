fun getGreeting(): String {
    return "Hello";
}

contract TestStrings {
    receive() {
        let s = getGreeting();
    }
}