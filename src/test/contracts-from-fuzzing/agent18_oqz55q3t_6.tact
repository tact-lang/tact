const GLOBAL: Int = 123;

contract TestGlobal {
    receive() {
        dump(GLOBAL);
    }
}
