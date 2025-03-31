contract SimpleContract {
    receive() {}
}

contract TestCodeOfCorrect {
    receive() {
        // Using proper capitalized type 'Cell' for codeOf expression
        let c: Cell = codeOf SimpleContract;
    }
}
