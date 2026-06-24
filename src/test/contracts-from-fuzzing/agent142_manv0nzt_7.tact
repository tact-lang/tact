contract C(param: Int) {
    receive() {}
}

contract Checker {
    // Correct usage: providing required parameter
    get fun getInitCP(): Cell {
        let pkg = initOf C(42);
        return pkg.code; // Extract contract code from the init package
    }

    // Also extract the data cell from the init package
    get fun getInitDataCP(): Cell {
        let pkg = initOf C(42);
        return pkg.data;
    }

    receive() {}
}
