contract A {
    receive() {}
}

contract TestCodeValid {
    receive() {
        let code = codeOf A;
    }
}
