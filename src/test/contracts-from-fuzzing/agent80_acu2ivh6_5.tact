contract TestUnary {
    receive() {
         // Unary minus operator
         let n: Int = -(-1);
         // Unary inversion operator
         let inv: Bool = !false;
         dump(n);
         dump(inv);
    }
}
