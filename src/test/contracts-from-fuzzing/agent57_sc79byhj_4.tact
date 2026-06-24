fun get_val(): Int { return 42; }

contract ReturnTest {
    receive() {
        dump(get_val());
    }
}
