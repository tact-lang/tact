contract X {
    receive() {
        // Valid usage of codeOf for the current contract
        let c: Cell = codeOf X;
    }
}
