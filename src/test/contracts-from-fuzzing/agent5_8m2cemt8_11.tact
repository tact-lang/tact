contract TestContract {
    receive() {
        let test = "Hello \u{10FFFF}";
        dump(test);
    }
}