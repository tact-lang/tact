contract A { }

contract TestCodeValid {
    receive() {
        // Valid usage of codeOf with a contract having no parameters
        let cell_code = codeOf A;
    }
}
