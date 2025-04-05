contract TestRepeat {
    receive() {
        let res: Int = 1;
        repeat (5) {
            res *= 2;
        }
        dump(res);
    }
}
