contract TrailingContract(a: Int, b: Int) {}

contract TestTrailing {
    receive() {
         let s = initOf TrailingContract(
            5,
            10,
         );
    }
}
