contract A {}

contract Tester {
    receive() {
        let initCell = initOf A();
        let codeCell = codeOf A;
    }
}