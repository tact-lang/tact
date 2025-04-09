contract RepeatValidTest {
    receive() {
        let cnt: Int = 0;
        repeat (3) {
            cnt += 1;
        }
        dump(cnt);
    }
}
