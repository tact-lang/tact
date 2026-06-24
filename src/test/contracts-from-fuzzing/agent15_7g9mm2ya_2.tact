contract C {
    init() { }
}

contract B {
    get fun getCCode(): Cell {
        return initOf C().code;
    }
}

contract A {
    get fun getBCode(): Cell {
        return initOf B().code;
    }
}
