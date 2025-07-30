contract TestEscape {
    receive() {
        let s: String = "line \n another line";
        dump(s);
    }
}
