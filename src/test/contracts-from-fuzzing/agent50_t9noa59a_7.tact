contract C(a: Int, b: Int) {
    // Contract with parameters using trailing comma in initOf
    receive() {}
}

contract TestTrailing {
    receive() {
         // Using trailing comma in function call parameters
         let s = initOf C(1, 2,);
         let k = codeOf C;
    }
}
