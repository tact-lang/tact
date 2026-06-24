contract A {
    receive() {}
}

contract Tester {
    receive() {
        let initState = initOf A();
        let codeCell = codeOf A;
    }
}
