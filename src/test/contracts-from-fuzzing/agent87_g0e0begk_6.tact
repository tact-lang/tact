contract WithParameters(param: Int) {}

contract Caller2 {
    receive() {
         let s = initOf WithParameters(42);
         let c = codeOf WithParameters;
    }
}
