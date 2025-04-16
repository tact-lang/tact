contract E(x: Int) {
    receive() {}
}

contract F {
    receive() {
        // Using codeOf on a contract with parameters
        let eCode = codeOf E;
    }
}
