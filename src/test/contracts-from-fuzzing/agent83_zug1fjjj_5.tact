contract CodeValid {
    receive() {
        // Valid usage of codeOf for the current contract
        let codeCell: Cell = codeOf CodeValid;
        let myCodeCell: Cell = myCode();
        // No further runtime check, but compilation should succeed
    }
}
