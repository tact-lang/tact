contract WhileTest {
    receive() {
        let i: Int = 3;
        while (i > 0) {
            i -= 1;
        }
        dump(i);
    }
}
