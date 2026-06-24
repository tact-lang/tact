contract D(param1: Int, param2: Int) {}

contract E {
    receive() {
        // Valid usage: explicitly typing the result as StateInit
        let s: StateInit = initOf D(10, 20);
    }
}
