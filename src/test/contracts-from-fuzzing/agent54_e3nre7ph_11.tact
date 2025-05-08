contract TestTernary {
    receive() {
        dump(true ? 100 : 200); // should dump 100
    }
}
