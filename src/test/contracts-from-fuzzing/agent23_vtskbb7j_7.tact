fun double(n: Int): Int {
    return n * 2;
}

contract TestFunctionCall {
    receive() {
         let result = double(double(21)); // expects 84
    }
}
