contract A {
    receive() {}
}

contract ACodeTest {
    receive() {
        // Test correct usage of codeOf, comparing with myCode()
        let code_data: Cell = codeOf A;
        let eq: Bool = myCode() == code_data;
    }
}
