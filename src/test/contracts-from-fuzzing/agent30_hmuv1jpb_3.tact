const GlobalConst: Int = 100;

contract Test {
    const ContractConst: Int = 200;

    get fun sum(): Int {
        return GlobalConst + self.ContractConst;
    }
}
