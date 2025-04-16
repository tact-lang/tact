fun multi(_: Int, _: Int): Int { return 0; }

contract Test {
    receive() {
        let x = multi(1, 2);
    }
}
