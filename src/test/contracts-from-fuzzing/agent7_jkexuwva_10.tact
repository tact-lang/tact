contract TestContract {
    receive() {
        let s = "Line 1\nLine 2\nLine 3";
        dump(s);
    }
}