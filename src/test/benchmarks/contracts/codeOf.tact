contract CodeOfVsInitOf {
    receive() { }

    get fun withCodeOf(): Cell {
        return codeOf Child;
    }

    get fun withInitOf(): Cell {
        return (initOf Child()).code;
    }
}

contract Child {
    init() {}

    receive() {}
}
