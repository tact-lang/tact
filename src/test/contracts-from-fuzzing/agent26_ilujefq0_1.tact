fun returnInteger(): Int {
    return 123;
}

contract IntegerLiteralTest {
    receive() {
        returnInteger();
    }
}
