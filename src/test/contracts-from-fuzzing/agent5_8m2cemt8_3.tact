contract TestContract {
    receive() {
        let multilineString = "Hello multiline
Second line";
        dump(multilineString);
    }
}