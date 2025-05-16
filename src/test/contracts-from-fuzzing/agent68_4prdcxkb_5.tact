contract TestContract {
    receive() {
        if (1 + 1 == 2) { dump(1); } else { dump(0); }
    }
}
