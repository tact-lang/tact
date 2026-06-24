contract Dummy {
    receive() {}
}

contract Test {
    receive() {
        let a = initOf Dummy();
        let b = codeOf Dummy;
    }
}