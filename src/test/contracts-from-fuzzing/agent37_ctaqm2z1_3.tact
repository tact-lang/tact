contract A {
    // A simple contract with delayed initialization (no parameters)
    // Implicit empty init() function is present
    receive() {}
}

contract TestValid {
    // Valid usage of initOf and codeOf for contract A
    get fun getInitCode() : Cell {
        // Using initOf A() returns a StateInit struct with fields 'code' and 'data'
        return (initOf A()).code;
    }

    get fun getInitData() : Cell {
        return (initOf A()).data;
    }

    get fun getCode() : Cell {
        // codeOf returns the code cell of contract A
        return codeOf A;
    }

    receive() {}
}
