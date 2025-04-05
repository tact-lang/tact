contract IfTest {
    receive() {
        let a: Int = 10;
        if (a > 5) {
            a = a - 5;
        } else {
            a = a + 5;
        }
    }
}
