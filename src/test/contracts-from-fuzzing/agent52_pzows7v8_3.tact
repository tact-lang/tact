contract TestConstContract {
    const ContractConst: Int = 2000 + 42;

    receive() {
         let x: Int = self.ContractConst;
    }
}
