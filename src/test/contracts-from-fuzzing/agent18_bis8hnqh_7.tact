contract IfTestValid {
    receive() {
        if (true) { dump(100); }
    }
}
