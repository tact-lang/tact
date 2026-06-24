contract TestIfValid {
    receive() {
        if (true) { dump(42); }
    }
}
