contract TestContract {
    receive() {
        let testString = "Hello\vWorld!";
        dump(testString);
    }
}