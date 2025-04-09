contract SelfTest {
    receive() {
        let code1 = myCode();
        let code2 = codeOf SelfTest;
        if (code1 == code2) {
            // they should be equal
        }
    }
}
