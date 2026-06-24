contract B(p: Int) {}

contract Test2 {
    receive() {
        // Valid usage: contract with parameter p
        let initStat = initOf B(55);
        let codeVal = codeOf B;

        // Dummy check
        let _ = initStat.code == codeVal;
    }
}
