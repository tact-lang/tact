contract RepeatSkipTest {
    receive() {
        let counter: Int = 0;
        repeat (-1) {
            counter += 10;
        }
        dump(counter);
    }
}
