contract TestIf {
    receive() {
        if (true) { dump(1); }
    }
}
