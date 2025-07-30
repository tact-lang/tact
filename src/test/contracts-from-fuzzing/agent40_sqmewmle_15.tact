contract RepeatOverflowTest {
    receive() {
        let counter: Int = 0;
        // 2147483648 is 2^31, which is out of allowed range
        repeat (2147483648) {
            counter += 1;
        }
        dump(counter);
    }
}
