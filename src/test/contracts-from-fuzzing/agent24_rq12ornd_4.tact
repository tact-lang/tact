contract WithParam(param: Int) {
    receive() {}
}

contract CallerParam {
    receive() {
         // Valid usage with a contract having parameters
         let state_init = initOf WithParam(42);
         let contract_code = codeOf WithParam;
    }
}
