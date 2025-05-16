contract EmptyBlockTest {
    receive() {
        {} // empty block
        dump(1);
    }
}
