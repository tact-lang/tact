contract TestTernaryValid {
    receive() {
        dump(true ? 1 : 2);
    }
}
