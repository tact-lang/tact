fun f(_: Int): Int { return 1; }

contract TestF {
    receive() {
        let res = f(42);
        dump(res);
    }
}
