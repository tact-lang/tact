contract ParamContract(param: Int) {
    receive() {}
}

contract TestParam {
    // Getter returns the state init data of the parameterized contract
    get fun testData(): Cell {
         return initOf ParamContract(10).data;
    }
    
    // Getter returns the code of the parameterized contract
    get fun testCode(): Cell {
         return codeOf ParamContract;
    }

    receive() {}
}
