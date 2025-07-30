contract TestContract {
    receive() {
        let s = "Hello\nWorld";
        dump(s);
    }
}