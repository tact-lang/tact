contract B(param: Int) {
    // Contract with a parameter, uses contract parameters syntax, implicit no init() function
    receive() {}
}

contract TestParams {
    // Using initOf with contract parameters should supply the initialization values
    get fun getBInitCode() : Cell {
        return (initOf B(42)).code;
    }
    
    get fun getBInitData() : Cell {
        return (initOf B(42)).data;
    }

    // Using codeOf returns only the code cell of contract B
    get fun getBCode() : Cell {
        return codeOf B;
    }
    
    receive() {}
}
