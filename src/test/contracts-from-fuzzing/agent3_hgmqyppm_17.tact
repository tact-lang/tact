contract TestDumpTernary {
    receive() {
        dump((2 + 2 == 4) ? 100 : 200);
    }
}
