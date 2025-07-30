contract SelfTest {
    receive() {
        let a = myCode();
        let b = codeOf SelfTest;
        if (!(a == b)) {
            // In practice, these should always be equal for the current contract
            let dummy = 0;
            dummy;
        } else {
            let dummy = 1;
            dummy;
        }
    }
}
