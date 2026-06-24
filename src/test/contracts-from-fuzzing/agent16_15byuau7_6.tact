contract TestContract {
    receive() {
        let s = ascii("Hello \"World\"");
        let x = s;
    }
}
