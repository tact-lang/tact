contract B(x: Int, y: Int) {}

contract TestB {
    receive() {
         let b_init = initOf B(1, 2);
         let b_code = codeOf B;
    }
}
