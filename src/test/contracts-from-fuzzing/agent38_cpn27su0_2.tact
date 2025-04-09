contract Test {
    receive() {
        if (true) { dump(1); } else { dump(0); }
    }
}
