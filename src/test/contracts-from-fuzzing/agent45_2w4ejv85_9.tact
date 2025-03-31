contract TestMyCode {
    receive() {
        let eq: Bool = myCode() == codeOf TestMyCode;
    }
}
