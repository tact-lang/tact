contract RepeatLoopTest {
    receive() {
        repeat (5) { dump(5); }
    }
}
