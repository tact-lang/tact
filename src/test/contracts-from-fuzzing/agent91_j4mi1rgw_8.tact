contract CP(param: Int) {
    // Using contract parameters syntax; no init() allowed
    receive() {}
}

contract TestCP {
    receive() {
         // Valid usage with a contract that uses parameters: initOf requires the parameter
         let cp_init = initOf CP(7);
         let cp_code = codeOf CP;  
    }
}
