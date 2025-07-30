contract ComputedContract(a: Int, b: Int) {}

contract TestComputed {
    receive() {
         let x = 10;
         let pkg = initOf ComputedContract(x, x * 3);
         let code = codeOf ComputedContract;
    }
}
