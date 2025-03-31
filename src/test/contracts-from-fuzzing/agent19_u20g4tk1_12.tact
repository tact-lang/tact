contract TestRequireCorrect {
    receive() {
        // Using require with a boolean condition and a string error message
        require(1 == 2, "Mismatch");
    }
}
