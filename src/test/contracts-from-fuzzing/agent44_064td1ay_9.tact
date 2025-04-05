contract TestRepeat {
    receive() {
        let cnt = 0;
        repeat (3) {
            cnt += 1;
        }
        dump(cnt);
    }
}
