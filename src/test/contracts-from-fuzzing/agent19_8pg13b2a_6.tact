contract TestUnaryNegation {
    receive() {
       let a: Int = 10;
       let b: Int = -a;
       dump(b);
    }
}
