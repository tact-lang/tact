contract TestBinary {
    receive() {
        dump(1 + 2);          // should output 3
        dump(3 - 1);          // should output 2
        dump(2 * 3);          // should output 6
        dump(8 / 2);          // should output 4
    }
}
