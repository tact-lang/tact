contract Simple {
    receive() {}
}

contract Main {
    receive() {
        let c: Cell = codeOf Simple;
        let si: StateInit = initOf Simple();
        let i: Cell = si.data; // using the data part from the init package
    }
}
