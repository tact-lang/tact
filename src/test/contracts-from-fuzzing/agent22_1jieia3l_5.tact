contract TestUnaryMinus {
    receive() {
         let a: Int = -5;
         let b: Int = -(-5);
         let c: Int = -(-1);
    }
}
