contract B(param: Int) {
    // Contract with contract parameters
    receive() {}
}

contract Test2 {
    receive() {
         // Valid usage: Passing parameter to contract B
         let i = initOf B(999);
         let c = codeOf B;
    }
}
