contract SelfTest {
    receive() {
        let isSame = myCode() == codeOf SelfTest; // should be true
    }
}
