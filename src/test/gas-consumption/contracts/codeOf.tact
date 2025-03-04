contract CodeOfVsInitOf {
    receive() { }

    get fun withCodeOf(): Cell {
        return codeOf Child;
    }

    get fun withInitOf(): Cell {
        return (initOf Child()).code;
    }

    get fun codeOfSelf(): Cell {
        return codeOf CodeOfVsInitOf;
    }

    get fun myCode(): Cell {
        return myCode();
    }
}

contract Child {
    init() {}

    receive() {}
}
