contract TestIfNoElse {
    receive() {
        let a: Int = 5;
        if (a < 10) { dump(1); }
        if (a > 10) { dump(2); }
    }
}
