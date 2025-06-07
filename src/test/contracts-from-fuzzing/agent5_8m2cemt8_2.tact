contract TestContract {
    receive() {
        let myString = "Hello\nWorld!";
        dump(myString);
    }
}