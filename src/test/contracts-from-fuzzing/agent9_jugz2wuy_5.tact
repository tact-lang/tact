contract B(x: Int, y: Int) {
    receive() { }
}

contract Test2 {
    receive() {
         // Valid usage: contract with parameters
         let initState = initOf B(42, 100);
         let codeCell = codeOf B;
    }
}
