contract Minimal {}

contract Tester {
    receive() {
        let s = initOf Minimal();
        let c = codeOf Minimal;
    }
}
