contract TestExt {
    receive() {
        let s: String = 42.toString();
        dump(s);
    }
}
