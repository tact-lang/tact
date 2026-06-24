contract SelfTest {
    receive() {
        let code1: Cell = codeOf SelfTest;
        let code2: Cell = myCode();
    }
}
