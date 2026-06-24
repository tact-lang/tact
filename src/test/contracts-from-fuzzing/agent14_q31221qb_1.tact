const GlobalConst1: Int = 100 + 200;

contract TestConst {
    const ContractConst1: Int = 300;
    
    get fun sum(): Int {
         return GlobalConst1 + self.ContractConst1;
    }
}
