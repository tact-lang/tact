contract D(param1: Int, param2: Int,) {
    // Contract with trailing comma in parameters
    receive() {}
}

contract TestD {
    receive() {
         // Valid usage: passing correct number of parameters to initOf
         let d_init = initOf D(5, 10);
         let d_code = codeOf D;
    }
}
