contract CP(val: Int) {
    receive() {}
}

contract CPTest {
    receive() {
        let s = initOf CP(42);
    }
}
