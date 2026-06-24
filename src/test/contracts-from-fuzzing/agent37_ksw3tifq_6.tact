///////////////////////////////
// Test 6: Valid initOf with contract parameters
///////////////////////////////

contract ParamContract(param: Int) {}

contract UseParam {
    init() {
        let pkg = initOf ParamContract(456);
    }
}
