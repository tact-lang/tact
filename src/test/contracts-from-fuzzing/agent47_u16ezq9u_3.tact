const GLOBAL_CONST: Int = 150;

contract Test {
    const LOCAL_CONST: Int = 25;
    
    // Getter to return the sum of global and local constants
    get fun sum(): Int {
        return GLOBAL_CONST + self.LOCAL_CONST;
    }

    receive() {}
}
