const GlobalConst1: Int = 1000 + ton("42") + pow(10, 9);

contract Example {
    const ContractConst1: Int = 2000 + ton("43") + pow(10, 9);
    const StatePaid: Int = 1;

    get fun sum(): Int {
        return GlobalConst1 + self.ContractConst1 + self.StatePaid;
    }
}
