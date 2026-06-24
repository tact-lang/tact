const GLOBAL_CONST: Int = 123;

contract Test {
    const CONTRACT_CONST: Int = 42;

    get fun sum(): Int {
       // Global constants can be accessed directly
       return GLOBAL_CONST + self.CONTRACT_CONST;
    }

    receive() {}
}
