const GLOBAL_CONST: Int = 10;

contract Test {
    // Contract constant, evaluated at compile time
    const LOCAL_CONST: Int = 20;

    get fun sum(): Int {
        // Access global constant directly and contract constant via self
        return GLOBAL_CONST + self.LOCAL_CONST;
    }

    receive() {
        // Empty receive function to ensure full compilation
    }
}
