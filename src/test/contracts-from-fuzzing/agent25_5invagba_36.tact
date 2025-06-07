contract TestMyCode {
    receive() {
        // Test that myCode() returns the same cell as codeOf for the current contract
        let c1: Cell = myCode();
        let c2: Cell = codeOf TestMyCode;
        // Since we can't directly compare Cells, dump them both
        dump(c1);
        dump(c2);
    }
}
