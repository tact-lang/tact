contract TestContractConst {
    const MY_CONTRACT_CONST: Int = 100;
    
    receive() {
        let x = self.MY_CONTRACT_CONST;
    }
}
