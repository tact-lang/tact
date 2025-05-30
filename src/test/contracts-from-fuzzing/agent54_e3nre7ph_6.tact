contract TestIfElse {
    receive() {
        if (2 + 2 == 5) { dump(0); } else { dump(100); }
    }
}
