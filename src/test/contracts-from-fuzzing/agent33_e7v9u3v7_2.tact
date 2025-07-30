contract TestIf {
    receive() {
        let a: Int = 5;
        if (a > 3) { dump(10); }
    }
}
