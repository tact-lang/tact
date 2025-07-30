contract TestValidIf {
    receive() {
        if (true) { dump(42); }
    }
}
