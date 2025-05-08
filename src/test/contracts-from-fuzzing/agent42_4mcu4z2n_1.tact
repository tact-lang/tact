contract Test {
    receive() {}
}

contract Main {
    receive() {
        let c = codeOf Test;
    }
}
