contract SelfTest {
    receive() {
        let equal: Bool = myCode() == codeOf SelfTest;
    }
}
