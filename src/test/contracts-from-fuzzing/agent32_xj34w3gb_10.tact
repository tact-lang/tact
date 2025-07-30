fun multi(_: Int, _: Int): Int { return 0; }

contract C3 {
    receive() {
        let res = multi(1, 2);
        dump(res);
    }
}
