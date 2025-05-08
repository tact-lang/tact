contract TrailingContract(param: Int) {}

contract TestTrailing {
    receive() {
        // Using trailing comma in initOf expression for a contract with parameters
        let st: StateInit = initOf TrailingContract(42,);
        let c: Cell = codeOf TrailingContract;
    }
}
