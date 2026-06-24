contract TestIfElse {
    receive() {
        if (2 + 2 == 4) { dump(100); } else { dump(0); }
    }
}
