contract ParamsContract(x: Int) {
    receive() {}
}

contract TestTrailingComma {
    receive() {
        // Valid usage: initOf with trailing comma for contract with parameters
        let si = initOf ParamsContract(42,);
    }
}
