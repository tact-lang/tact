fun foo(): Int { return 123; }

contract TestReturnValid {
    receive() {
        dump(foo());
    }
}
