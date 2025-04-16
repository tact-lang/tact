contract InitTest {
    init(x: Int) { }
    receive() {
        let s = initOf InitTest(10);
    }
}
