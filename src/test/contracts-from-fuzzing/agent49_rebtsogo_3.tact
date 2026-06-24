contract Test {
    receive() {
        let x: Int = 0;
        if (x == 0) { dump(1); } else { dump(2); }
    }
}
