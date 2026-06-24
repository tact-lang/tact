contract TestTernaryValid {
    receive() {
        dump(true ? 1 : 0);
    }
}
