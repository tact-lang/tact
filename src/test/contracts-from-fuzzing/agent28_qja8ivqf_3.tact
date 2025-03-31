contract TestContract {
    receive() {
        let s = "Some\\backslash";
        dump(s);
    }
}