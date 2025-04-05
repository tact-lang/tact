const TOP_CONST: Int = 100;

contract Test {
    // Constant depending on a global constant
    const INNER_CONST1: Int = TOP_CONST / 2; // Expected value: 50
    // Constant depending on another constant inside the contract
    const INNER_CONST2: Int = self.INNER_CONST1 + 25; // Expected value: 75

    receive() {
        let out: Int = self.INNER_CONST2;
    }
}
