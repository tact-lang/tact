contract Test {}

contract Caller {
    receive() {
        let i = initOf Test();
        let c = codeOf Test;
    }
}
