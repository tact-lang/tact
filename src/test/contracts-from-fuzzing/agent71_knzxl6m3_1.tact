contract IfTest {
    receive() {
        if (true) {
            dump("if works");
        }
    }
}
