const GLOBAL_CONST: Int = 10;

contract TestGlobalConst {
    const CONTRACT_CONST: Int = 5;
    
    receive() {
         let sum: Int = GLOBAL_CONST + self.CONTRACT_CONST;
    }
}
