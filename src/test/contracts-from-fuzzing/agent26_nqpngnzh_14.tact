contract TestRepeat {
    receive() {
        let cnt: Int = 0;
        repeat (5) {
            cnt += 1;
        }
        dump(cnt); // expect 5
    }
}
