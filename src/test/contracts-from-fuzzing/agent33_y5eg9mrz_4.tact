contract SelfCodeTest {
    receive() {
        // Using codeOf for the current contract; should be equivalent to myCode()
        let c1 = codeOf SelfCodeTest;
        let c2 = myCode();
        if (c1 == c2) {
            // Do something
        }
    }
}
