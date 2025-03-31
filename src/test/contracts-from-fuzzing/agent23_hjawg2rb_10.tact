fun voidFunction() { }

contract Test {
    receive() {
        dump(voidFunction());
    }
}
